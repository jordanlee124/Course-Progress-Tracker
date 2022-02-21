-- extra database definitions

-- for trans
create or replace view trans_help(subject_code, term, subject_name, mark, grade, subject_uoc, person_id, given, family)
as
    select s.code, t.code, s.name, ce.mark, ce.grade, s.uoc, p.id, p.given, p.family
    from course_enrolments ce
    join people p on (ce.student = p.id)
    join courses c on (ce.course = c.id)
    join subjects s on (c.subject = s.id)
    join terms t on (c.term = t.id)
    order by t.id, t.code, s.code
;

-- for rules
create or replace view rules_1(program_name, orgunits_name, rule_name, aog_def, aog_type, aog_defby, program_id)
as
    select p.name, o.longname, r.name, aog.definition, aog.type, aog.defby, p.id
    from programs p
    join program_rules pr on (p.id = pr.program)
    join rules r on (pr.rule = r.id)
    join academic_object_groups aog on (r.ao_group = aog.id)
    join orgunits o on (p.offeredby = o.id)
;

create or replace view rules_2(stream_code, stream_name, orgunits_name, rule_name, rule_type, min_req, max_req, rule_aogroup, aog_type, aoq_defby, aog_def)
as
    select s.code, s.name, o.longname, r.name, r.type, r.min_req, r.max_req, r.ao_group, aog.type, aog.defby, aog.definition 
    from streams s
    join orgunits o on (s.offeredby = o.id)
    join stream_rules sr on (s.id = sr.stream)
    join rules r on (sr.rule = r.id)
    join academic_object_groups aog on (r.ao_group = aog.id)
;

--for prog
create or replace view prog2(sub_code, term, sub_name, mark, grade, uoc, zid, name)
as
    select s.code, t.code, s.name, ce.mark, ce.grade, s.uoc, p.id, p.fullname
    from course_enrolments ce
    join people p on (ce.student = p.id)
    join courses c on (ce.course = c.id)
    join subjects s on (c.subject = s.id)
    join terms t on (c.term = t.id)
    order by t.code, s.code
;
