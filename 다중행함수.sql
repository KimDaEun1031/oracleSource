
-- ������ �Լ� : SUM / COUNT / MAX / MIN / AVG
-- ���� ���� �������� �ϳ��� ������� �����س��� ���� �Լ�

-- SELECT ename, SUM(sal) FROM emp; ����
-- ename�� ��⿡ ename�� ���� �� �۵���

SELECT SUM(sal), SUM(DISTINCT sal), SUM(ALL sal) FROM emp;
-- distinct�� �ߺ� �����̱⶧���� sal�� �� �� ���� ���� �ִٸ� ���� �� ���Ѵ�.