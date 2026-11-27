Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795811635;
	b=utuCG1T/6NwJv1gagmhBxd5+Hoy1NXBlnQxV4RBCIWVo4RTEE81yK3mY8ocFsTz+d7Xi
	 BxlCa8bkrtI/khhHkH853uxw8l71FKl90DvY86NayUq/q7xztGFZKhT3k0OlxP8vGqPJv
	 QsPiphijK2GPFHC0eGlIZI9zPeLPQ6TUTOQcA1ABkuzyInWcTkB3pUgGm7UoGegJ5Gv5g
	 wSaDFlgo503kvR+QLnmpPc0EB3i2ioktYRuvREA7bsPw3Xvl/XVsZO3/dyr/VYDVfOD39
	 jwRXKW/ykJtt9bhrMqp8oMEBW4gv9V6PWNOqyVg9Qvq0qX8hXE1dZaOE1qsTnFm9HjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811635;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=M7NWEtOCA/msVj4P3QXkAvYOuQUhm34azwePsoxk0sU=;
	b=HRbOIogjWR324frNrZaEK5mrgZOyK/jgL4V1nYSSfTHBLK6/RxLgdTZFdAOZ+3G0rvcM
	 Hae/27bcM4UEfnPQMi4QoOg2ni1Sh+2/yFEu6cMJktRnkHQeUPKWxOlMBIAuPJ7AwffKa
	 PJR5tvo/h3IIfvm96NlQLHjHfh9a4P7MT/enzXb45A+cg1lRrHloxG1aolUsBV9p+Wjq0
	 isOH1bmzwIkCxwptoqzjorcj2ZadXGFd0KvZGRJeNZaf9lZID2qQ+MgzBBprJvsVkFeby
	 7vRb6BXQIWR8AjA3J3Mw4kJmr5CmaAXyEAfOiBptYcvWsGiEi+jusJAW+mqWdLCWJrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fuuoNibx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HkteGFQg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8976606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8976606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fuuoNibx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HkteGFQg
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJAr072127747
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M7NWEtOCA/msVj4P3QXkAvYOuQUhm34azwePsoxk0sU=; b=fuuoNibxWVUUBiwo
	KKdAgXaDFx346+48fl6jf/yYRBSHxXzmSVdTRM77QYnK5yUtT6L5sZGhkVRnfaaU
	MsTtprL/SAeJqZdZV+toq/Zr6TL3I/ksjY07p1bcSYp+nGUWP6iS9bhIlwtPUwv5
	aCrVBoMVdpct8IYBopQLnsAKbFwKs7aaRWAzXEcYbngeeGZUxsVZKvVDWXcGDxCF
	Z67c9tu+wNI1T/sWNpwhb5vpWfQlA9QgF7EVEf1o+vRt2a4iNA6opwIm537GmU8F
	l1qbLoA0phvLd+n1WQZEdgfWzu3h1UDCTlBSj8SxvCngFC+vDrXDWBpsjLHzC077
	u5SHoA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7e7d0eh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:33:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so1255688985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795811632; x=1796416432; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M7NWEtOCA/msVj4P3QXkAvYOuQUhm34azwePsoxk0sU=;
        b=HkteGFQg+XXIibWQKhGtlbgzrRb2tK3qhU0z2RENhEXYN0k216VIUOZPiR8COHPMJ2
         SPdGfgBnQL86xou0JLmmstM5uHJbFIUkdGiJR+0erO6mZs3sdIj1xwP5AD01nZxlgrZX
         G4M5ciCrsvJ4hKjHQdGvUzWa6+MXAILN2pQUqx6k069gNSs85jBCdot93nU6q1cDhEoI
         TInHhRi09c6rerQAyNFcy0Te9RIcSYtMvx5hjmXyyTnfGw8NHyZd2Zx7U47g+aOUEYtZ
         QqyL+LRaUJmIQm6Am6eXLzUtmQzJnzBGBAltFVIJWFJt2C+tpNcrEA/LhpREJrZUBffm
         VFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811632; x=1796416432;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7NWEtOCA/msVj4P3QXkAvYOuQUhm34azwePsoxk0sU=;
        b=fMJPLrXUTGOk2E9tVlII7V8R2UAWAiZ/dMc7wT1iU5EP86LL8nrq73M0jDOx91R0Hp
         VfdOap4tyHzYNlmI2wZG4rgl41KK7qwurLL4+CeH/Q9X4TVqLhYiiKCswKQe1js8qZJ+
         sOXz1A1Ms9xGX8qAjoZ8eLSaAPd1NDSX5ByRNOM7/kSUnik7uLBOHWIMo/FO++f5fYN7
         3AWo9aY+Mf9AtgM1Qp65fJvm5KzTh7YV7KoBXk1od2jtZU8k4edSoHb8OcQdS5LH0iSc
         KojncVP6iE6m1vVq63GbP8UqO9KBVLok1QIkNstgQqBCMEUrtK0iogW1aIgsjUTZyDAm
         fP2w==
X-Forwarded-Encrypted: i=1; AL+hErEIu4wWx3of1NvjhaceLpuLvdCCRK+5gXVcWvFXw3PyJofMdYxRzCOKkPAQEwJmlGSGeEmPE5ATHwnQy60=@vger.kernel.org
X-Gm-Message-State: APuU4Z/30rYG85J/y6N1JGSF29w/MWJHIJQ/Evoty2ATdSPbSLiWuWR0
	Fy+6BwTMEeF5nRDS8xVEHXAGCRJCiq8DlHturnaTrywIxsEDiEHwT8LDH6CwipaQNuy6McK7pEF
	EiIWcJLAcIepZ+LIiPgzDfcAwcfxoBxc9PsK6Mo2+aAsKjW1vTB/9lmK8puHUjmZ4R2s=
X-Gm-Gg: AZFdTZdlIjaaVgQ5oeqqJYD0llk96Ruqxo5hSxU2I8lvg1NO9TkdqQ+8PdeIzy3RKMM
	FYXstS6TgtPv99UdS50vjf+/H7AiylXfPh+RsqaHZQYUcAg579uHd4G+xCzwsU9A+0K+kvdeWu1
	++DTRwsizD1Fl93HJcQ1SvFBkXZ7Pt/VtmgWwwLqHxheyConINSQeE8FiCdJVmP7cLUJL1C2E+6
	9Ce5WrNX7H5/z8Vu0Dqw+5Lh02f5mwWaLj+uuIQZZknm1KTQ4Lts82W8kj6ysKcC0OKOjFDgHX2
	8omThJT/+EM8O494xRa4fOI7gRM4tWSo7Zh95Uyj7fjZgqUKwwxgUGJ+zcv7Pg9H3KdyiO4Fihw
	420MGr1Atngyn+JLa00COH37c2sMFQc55NJ4XLWIJTlBKxtBrP6HO2+hrAmt0dA==
X-Received: by 2002:a05:620a:1a28:b0:93f:1936:b20a with SMTP id af79cd13be357-949bab284f6mr4399629885a.76.1795811632257;
        Fri, 27 Nov 2026 12:33:52 -0800 (PST)
X-Received: by 2002:a05:620a:1a28:b0:93f:1936:b20a with SMTP id af79cd13be357-949bab284f6mr4399625985a.76.1795811631855;
        Fri, 27 Nov 2026 12:33:51 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm48338546f8f.32.2026.11.27.12.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:33:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RESEND 0/2] PCI: of: Skip config reads for disabled
 bridges
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        Daniele Briguglio <hello@superkali.me>, dragon@radxa.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
In-Reply-To: <20261127-pci-of-disabled-bridges-v1-0-3bedcbe51cda@radxa.com>
References: <20261127-pci-of-disabled-bridges-v1-0-3bedcbe51cda@radxa.com>
Date: Fri, 27 Nov 2026 20:33:47 +0000
Message-Id: <179581162724.3905807.13798536034754126199.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=423;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=TZkDGwJBtyA0TiNJhNB/OSVSV/aagdKBXEGWAdK0OLk=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBrCektwUucylrVH5BWh5c4Ud4McwsPdJqTGiBl9
 dnw2xSBuVWJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCawnpLQAKCRBjTcTwaHBG
 +DMWD/wNRZ+rlpDvMQQwnU9WtQcj8Q8Bg5b8dB2Yw8r2gPvmqD28DZeiYtjDTPWIdufB+iqgz5k
 08Oy0/zegQmPIY4RI4Chc3nJVaJXm5+Q24F1IfX1gW/g92ofustFieS4e8CsLo8YKOZMPlUBI0I
 lfXJlQqibG/hp63ZeYoNtwEJSjJOwU01etsgdsOJUeZiqcw1Q942oaLpYAK14p+Tl2CGZ5n9sNf
 kx8pY0Gk9d9JorphQkOYSN7zU09LaCTXnb506TBnvr1WQd+KjFc8a0DbVeEn7AthfMNExY/E8su
 E4apPcjKnPDstI6cL4Qa3acHbxmGaXXR5phfOaWJRaHzZQIoj7SariTGgq1VS6MSa4EGII15tZT
 HmYyMS9Ias5gBk4D3ngSRwk+y/9CIksmiyB1KhHbCo4YVwkL82U2vPd6gdqi3dsA7dtx+8gQr3X
 l/IOARrDpbLzhjrWkZrcmxHTiUcKmrq4CjZNRlSS3IXk/NznBYaR4GnSpJHDqrEkJZZp3jte6O1
 AV6n2qC+eoaN1ODqBIDCLh9wSBS1FdU+4dC6rK7WLP5rXwl8rqNohrGtM/izCvEtXEeu2fiOQfa
 BZysQQPlK6osqHi8VKGKaPdL5qkD+go0wo44qHrINp3/xdPCnDc7uwzFMu2jpePgCZtKOSGiV73
 HIIHqY3tgukda8Q==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-GUID: jgXFDxR085kEZqm1W0LIeRPAwELNa5sm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX96vCwqoMDvcs
 OsBtAxxCRsrg01rXIPjtQE091cfJgB1h+Nq41B3cLnU+9euStdbEq1nX89rmoRwIWk12VvkrrEk
 2zb3y/KMsfaQkY/Y1IwZxGe56vT2GXaBoTKYT4wdz6jqPi0Z/TShFVR7Cp9ws0FC0FwVPxDW5Hn
 CU90YfHGrmB6r2TuIzArbpEUaj2FvD2VnU9d41JmqusmpYFp7yRvD53iaQ/6uJSVrbjUopTI4v+
 CZT0vuBVUpLpW7CrkLrQutBABXrZUOhfc3buy0TnEsWj2EVdI7YlNhnIQ85evCm47q+8D472m1V
 jL19m0TZlWU+F8xCnAUuhdlo/rjmYAhgzMVveGwzPy++XM5kRUZVx+ZZ2zqUi/x81o0sYpzCtc4
 JkUC71sEYs1LoD8dIua4s0nQRPyJC7ad5+lHnbjnWo7WZh9olirnveedcu9WDySFVYAdaK0bHq1
 5h6lwi3O1+iXJoAM+FQ==
X-Proofpoint-ORIG-GUID: jgXFDxR085kEZqm1W0LIeRPAwELNa5sm
X-Authority-Analysis: v=2.4 cv=cJh1IVeN c=1 sm=1 tr=0 ts=6b09e931 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=Rh4h1jE-l6Tb1weBNBoA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX8tvI/63Ht7Lo
 Xkf8IPaQqJYDJAXOlqssK5yZJ4Dc6myqeCvPfm2zjkINkEZGz3lM760A1UPO/AZ8IJ5Ybzm2/iC
 WXtQDENXyIqmK86IIqWyHF6l6KOaRZY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270081

On Fri, 27 Nov 2026 19:49:31 +0800, Xilin Wu <sophon@radxa.com> wrote:
> PCI: of: Skip config reads for disabled bridges
> 
> Hi,
> 
> This series extracts the PCI change from the Radxa Dragon Q8B board
> support series for review and application through the PCI tree, as
> requested by Manivannan Sadhasivam.
> 
> [...]

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard

