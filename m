Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810556;
	b=q3EE6qgJ/OICctFjTw9HEMlzFJakdGeNH9/YAJzsBEksjxiOzkyKlNeJoRAYZ7OqBzRe
	 TDRH9muENV29Ycn4lt0R53XwbGDZTrOi6u6y8qnyvjlHroArLotTeJmve1qaj8iY3hPze
	 pj10xMryGU1D+ZOMeAYOZHAlfaLLwUaew06+TXGEocbRElPB4IZJ51BHlr/jlQZ16QUm4
	 FvB4E20GHbWSFv5C4vMYjsvTfk3B3WS6ITwDGL4qovJ1I1OYrrO9KJSCKKW2mOFlYpkMD
	 5ZKxnkYr4AfhvGyKb86WZ7fsjxTVZuygF9ojx94ApojALDe0BC4nkrqtQo5yyZqJCcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810556;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5gNzs6EANygMZK5ge43vpOx516Pj7m7kYw7rk2R+/3s=;
	b=uA8BgCeV88mFHE/lQgC1NJFIhxiTNDbnEywrLwufOeIXnKTAg7UAtWDcf/Iq+xjHLi0B
	 +rochdEHahNyBOCHsfhf9NyLfibQuQwBr/Shb17EkllwB5yF8DMStbqUy0UCoRigiwZit
	 xWXynx9KVj/PPbnqb2RY4PP6OKeenDgvZ5SPlBU85i5wMFpHAoA5ZH55sknYGL0ci3WdY
	 sYaoWmryFD0Ffke+wFyiTlr9U0AM+dsustPxEZrOHWGUlaEJ/vvh+vK/0WCcftmep9Cko
	 gflRqZxtt5+RYQHBO4AHvQjSzuL5hAzv4YQuRIuCHrEgX3AFO68BfMeZcw9Okn2QR1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfV9vyPu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NblgZHC0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AC7606A333
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5AC7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfV9vyPu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NblgZHC0
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJTknL525480
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5gNzs6EANygMZK5ge43vpO
	x516Pj7m7kYw7rk2R+/3s=; b=JfV9vyPudrDx2Re24l9pRGmD6DeB+zU2fzjR5t
	oEWwTgUk5XBlMfnCO4nuy54wDyG5eOAyZv2eaIF/aBtese/jT9BlBZxTb24XXoWI
	NlcfdzbGWwzq5mZISUytpcXVw3WmIij0Dpvr7ko+9UCyN5DI9m9evKdZjNGVfG/p
	Elobrocs5/ENMgBaskuDtEPNMeWt74RYBf+dRqmBp1IHeGWYWkGhSTxxV9o/2yna
	3a1ROmp/9dKwWB9Yi2NGluowy+EXjWiDWKYzx2sHZmnr/ebZN58SvDsEr4pxwQhC
	TYkeCstOzxBNTmSqgl7jq5QZaCrfvRospcLyh0lA5h2eFPJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g2dr34m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:15:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949b0d322fcso1378576285a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795810554; x=1796415354; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5gNzs6EANygMZK5ge43vpOx516Pj7m7kYw7rk2R+/3s=;
        b=NblgZHC0dYhSHWav/i1t2O4dhx13bCVdx9G+ZY1pTKT79M6SG9CiB9pwS5tVOuPiYV
         vJjSogrmlXhvXLF6WfcHWEdYFRu1+mI4t5MS4eH5QlmA+KfIPLaTC5HwtwpVga0/X+q8
         jeiKWKwL1SHZlDw8fBaaOZw5fJUIz9KgFyNDqyxyTJzCuAcRUk6A1m+U1bJU5eLLMNPz
         gbf/M0gZKcrvLXJryykQcZMeK5+IXlaVNlI1mVKrzc0bU/BaGSwUXJg5fHF1JP283DsY
         iGTT/msbR+SbtXX4Z7Wm44CW6NmrmCNFeAQTNwHhmTbDrNDRvPazDAu5+yol6t+NWPdP
         fM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810554; x=1796415354;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5gNzs6EANygMZK5ge43vpOx516Pj7m7kYw7rk2R+/3s=;
        b=bYavm2q7U1i+87VRXAgYkQlfasInqluSW1O92JNwoW54UcQyM3vHuTbjjem46IV7Sj
         /Dk/ye2Vep88eLHWwEXQzIONoHhS3Q/FreZEayD22jFr1QS75sW/UBxsgpjMihDGlgit
         OnHsDEyafYE2meJKgCHcWvJnUz2+1ZwzJSphxGhsNk9n+JRLuiaUVzU5x7+Vc21idszd
         UVGznCIpxaoslcIT2WwiY8PqcCXbd5BbdyzaLovcukwp1suBF/oXVtYrmizKFurL9j0f
         RLZ1vyje0vPPbww1CfBNA2iSk9FMLqOmFWyHtTW9mOA8HmTSzQj1AReodVDnOvci1Vqw
         +JHQ==
X-Forwarded-Encrypted: i=1; AL+hErHSqh7uGtqRlLIVv9Z3IFxohZawDX+N5egdqrHhG1v7om8KUWL2CAOsyCqnBB2QU0VKCVQm5t0I6xXvkgk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zFpBd4m33U9kw1HrHooZpRMakTWduUzLc6yxkEBWEVMlUlhcp
	yHD7W2rQypBiRB/lYJ0sVHL4mkLNPHNnU0qL7z48HHBD218ODgSXBKbs84mrJNmtSCScZ7yFOnJ
	BEbbNZrma/kb9V7UKg71qECTcLcxVR+cJgPdLUxVGddry+tO/P3DyRIvEHXvdrp5bC6M=
X-Gm-Gg: AZFdTZf2iCVIgA2sMs08AncKhbE+osvz85OLCjZuGQu/oFK3KU+vX0Qa6YLG6Wx1nDT
	NHG7mtZSbUjNdIAsEQYZgpZ7kILJXYcFDEW+NWxenAUCTXaSvK6FrvG8St1OOClhsf6Zr/+pD97
	eneon9IG2684iV3fQMPkutOYVFW/rQ4UXiedD3xgy6emLT5bSsDqecBAou0eiHYk8rP7+1cTIWJ
	DVag9ACw51N0KYxSUs8m4OHkDWOmt1/2Erm6uKJMgOHM4eoka4WSc66xGOelma6oFy+ka9Q5rYt
	SsLtne+HFRwt3S7T+Ql96X5/bfz6pr6Zh1shn3I1BnISfAEz/pN91N1GoV014DuiGscq6FcKy7I
	tppAjm+z84nPP3zDweizt7Y/j0BZZzVuTqVnF3ld5uhMl2jGgnIGVON2mzYQheGwPN6Py8FD4wP
	vGDg8qmtLorn/NcpAG9Sb5YpYNQ+xl0xPOwUuV1sS419UczZE422YCWNtOvVj+xg==
X-Received: by 2002:a05:620a:2956:b0:949:9cf0:badd with SMTP id af79cd13be357-949bab2f511mr4493863085a.73.1795810549308;
        Fri, 27 Nov 2026 12:15:49 -0800 (PST)
X-Received: by 2002:a05:620a:2956:b0:949:9cf0:badd with SMTP id af79cd13be357-949bab2f511mr4493808685a.73.1795810544398;
        Fri, 27 Nov 2026 12:15:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8050fddfsm64591511fa.16.2026.11.27.12.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:15:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/3] drm/msm/a3xx: follow the msm-3.10 kgsl CP setup
Date: Fri, 27 Nov 2026 22:15:24 +0200
Message-Id: <20261127-a3xx-fix-me-v2-0-839408d293ed@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIANzkCWsC/22NwQ6CMAyGX4X0bAkdkRhPvofhMLZOZoTJCgRDe
 HcHXu2hyZf/79cVhKNngWu2QuTZiw99AnXKwLS6fzB6mxhUoSpKg7pcFnR+wY6xcVRyZdiysZA
 u3pFTctju9Y9lap5sxl2xN1ovY4if491Me++/eSYs0F7InQtHjSa+BZF8mPTLhK7L04J627Yvs
 Wir1L8AAAA=
X-Change-ID: 20261111-a3xx-fix-me-bf13e6cedecd
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9u2J6T0zD+aRYytEaKwDgO4p8UYRuVHirQrfymlclSA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCeThc6JdlLTLoOb2UMIBzZKLjUDoTPdkeAM9H
 WiFuLL8TEOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawnk4QAKCRCLPIo+Aiko
 1VC0B/9h6hsIGfLVmQnnbkrKuIXaE2zGfHHJ4pycLV+JI20l2iQ4XDuXbCQXPP249Z65RZ0ji3o
 qOM0I7lhr7sKY0Z0ZEIz+PgBqkN4v1OqHdWtfnQzesod8IkOhNxAPCL+IyfgznNYVroNvopdTuE
 g7l2G0liQQnVJsNnMNi0VNeh/ANHY9HpFIG9Nts2ux5HYTHnnvTbbwUtEV3RUOAdTeS+p/8YlwI
 iMOKhyG7NUEPRNOBKt0Ki0zHvPqtRPpLowlyK1DK0BeVBmf+Law8RW2aMCiv1jhExd1wsnBiMsP
 FXuVMvyvodwi2QJRJ4p3vF3hRWjhvAZAMkx5Mf1MIWnNVsnz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfX1ANCrNEHVNg9
 oTZtH9vx/IDrObuMv2drfG4o2CsELSDzfArxlqywet3Cdd020z1Kvcb+1p9t+b4E+Ogpb2gPetG
 hfgp08x5+2V2xbSffKrY5XiLmNC7LjyVLpy3TZrq/zFh6OiGlJNHU/4J1slZhvUa6T/tMyamgry
 ajA056urmbrYxtqG0wKrarBnYszYij/uX/nwObBRrvAFjjvQ0EGBf7RjUgjlJz7Cs427k62k876
 2VQjifxg+J5ejGql8fgfinIP+N6IBLsFhQQBbgSViDvi09OmpiIReKmxNrwJCzt3GSo3w2njn7a
 qdxUiPVBbmPdpB0n5M/SKw0FvSwb1bc5cXEUHONTaWTTmKi8eKRaJYHv8HUizQqR1BBdKtUJeuo
 0scbq4Sr4Eg5E9dbRf3uogBrssIdgrN6XIx+Y5UVQzG6HISSXmIUTtS6gQhlPD6WbU4ozlnbOtR
 9qlSQV6oC1NFmRVXvKA==
X-Proofpoint-GUID: WBIdt3WRJbNmEzDAJBV2KmSvABB-1lCL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfX7AeKDisVAFTb
 Xus3DqorVEpfw14Uy6nXRiYTneHmbNo+Lgf7ppHpqKlm1vFmm1ZvfXbjrRdkpkLNF6mlGik04/E
 cM7m5xZL8rCATQP6gUydBR7j1aalm5U=
X-Authority-Analysis: v=2.4 cv=dJEzC+Zb c=1 sm=1 tr=0 ts=6b09e4fa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=QxjlNS_XKnkpB_o31RsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: WBIdt3WRJbNmEzDAJBV2KmSvABB-1lCL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270080

The a3xx CP setup in msm still matches the msm-3.4 downstream driver,
and a3xx_irq() silently acks the CP error interrupts it enables, so a
CP error only shows up as a hangcheck timeout. Report those errors and
bring the register range table and the CP_ME_INIT data in line with the
msm-3.10 kgsl driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- decode CP_PROTECT_STATUS via register-XML bitfields, not open-coded masks (Konrad, Rob)
- Link to v1: https://patch.msgid.link/20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com

---
Dmitry Baryshkov (3):
      drm/msm/a3xx: report CP protected mode faults
      drm/msm/a3xx: update the CP protected register ranges
      drm/msm/a3xx: update the CP_ME_INIT data to msm-3.10

 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         | 32 ++++++++++++++++++---------
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml |  5 ++++-
 2 files changed, 25 insertions(+), 12 deletions(-)
---
base-commit: bbfe1d58f42ad2cb56a01f5717355901698075e4
change-id: 20261111-a3xx-fix-me-bf13e6cedecd

Best regards,
--  
With best wishes
Dmitry

