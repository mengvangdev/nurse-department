class MenuData {
// 'Department Information'
// 'Center'
// 'Admission Information'
// 'Department Administration'
// 'Student Activities'
// 'Employment Information'
// 'Teacher Certification Program'
// 'Graduate School'

// for website
// Department Overview
// Centers
// Admissions
// Department Administration
// Student Activities
// Career Services
// Teacher Certification
// Graduate Programs
  static const List<String> titleMenu = [
    '학과안내',
    '센터',
    '입학안내',
    '학과행정',
    '학생활동',
    '취업정보',
    '교직과정',
    '대학원'
  ];

// '학과안내',
  static const List<String> departmentOverview = [
    '학과소개',
    '학과장인사말',
    '교육체계',
    '교육철학 및 교표',
    '학과연혁',
    '교수소개',
    '졸업 후 진로',
    '오시는 길',
  ];

// '센터',
  static const List<String> centers = [
    '센터 설명',
  ];

// '입학안내',
  static const List<String> admissions = [
    '신입학',
    '편입학',
    '장학제도',
  ];

// '학과행정',
  static const List<String> departmentAdministration = [
    '공지사항',
    '학사일정',
    '교과과장',
    '교직과정',
    '자료실',
    '간호교육인증평가',
  ];

// '학생활동',
  static const List<String> studentActivities = [
    '학생회사진',
    '사진첩',
    '학과동아리',
  ];

// '취업정보',
  static const List<String> careerServices = [
    '국가고시자격증',
    '취업정보시이트',
    '취업공고문',
  ];

// '교직과정',
  static const List<String> teacherCertification = [
    '교육과정',
    '공지사항',
  ];

// '대학원',
  static const List<String> graduatePrograms = [
    '교육과정',
    '석사존문',
    '졸업자격시험',
    '대학원 공지사항',
    '행정서식',
  ];

  static const List<List<String>> subMenu = [
    departmentOverview,
    centers,
    admissions,
    departmentAdministration,
    studentActivities,
    careerServices,
    teacherCertification,
    graduatePrograms,
  ];
}
