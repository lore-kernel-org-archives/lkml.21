Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671881;
	b=rQfuRwaU8Y3BsTUVd/Yjs7L4Gq1rZGrDu18bSupJokLYOR24lE8dIUEPG1oKwR0HR5wI
	 3s00LxYq36wU01vo4vvLpjmVcKY6457yr5I5FFlY8xi4djinACWrehx9WzBxrq3sHDaRy
	 DgVVi5vIF2m/NsbfsZiMN1b0sEY7XPaSDi/Ok81OoxPsWQKc9ZzBMq5MaF1Na2TFwpKQV
	 P5IHPYwaHrqbVdAmNYmb04QxOEADcNX2NkZexeUbOzw4grSp/KkrUKbmERhREaCIqgFnz
	 3oKwU29d0hy8yGdDrLX3udyetQTyLLvE7cDwjJHsxytzEeQCeYuXYRv69tXnblcXoXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VFb2pJiY8iJvPy2vop/0LNRFAle+KcEVjqNYuL16LLg=;
	b=hZGYwE61oCXkv1fLu7talXrwBtkHUOfoQElxjGDuJX7+zhFcoY5XZWx1MVRmQddTukmo
	 jXZ1cdK9MaN7toAkgQNI0FpJyW7fDx3BG0oOf0yrK0MZCPQy0HHuulkI19vMHJWJeTNP0
	 9v7xt8/bBkjHPjnZqHaijfFfgop+CADvicBs677DorhmSc4k/N862VooZVsqkwBUcwiqh
	 UZHPQzurLMxzDC1H18fiwjyVvxcHDF1MvxAeLAJ4quKh4PsZ3CkRUNVsWAiPoAslbOTtJ
	 hsiwYaIotXGNgrsiynEA+kyez9TgtHNK22pa2iUEnWYZi5T/4uoxOGeKnXmafhu7KKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c8std5FK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JEoVe76F;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B723606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B723606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c8std5FK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JEoVe76F
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36foR170293
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VFb2pJiY8iJvPy2vop/0LN
	RFAle+KcEVjqNYuL16LLg=; b=c8std5FKk24ssludg9uB4gpf3iseRkEHY5dG/h
	F1IioKRWcme9bMXRItiCrkSMoG04K5cuXkqt2krU2kWrnNTaBYfXReML3XMmd3RT
	URgUQVP32WZsksqKPVesCdiDFAq+z4eOhOi4gam7hwv0/cIR/1QaMuzwAlBlY07U
	EGOslgkuekgLqW305q36Tli5bWCQV5NXZGz0Ko2dkJAijTOV0HdjBRY175fyVHGH
	RDqpWhoZeCLsKzaLX4uPQVbVyVLOp5CZoB2XALYHfNQTbvgHFQ7ZzjdBdAsq+dPK
	5CWbCErPiEBOYiNQi0t6KFApv2cJCwIhWSHn3SoKLCxh4Kbg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukv4hx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:44:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386c3309469so2582475eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795671879; x=1796276679; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VFb2pJiY8iJvPy2vop/0LNRFAle+KcEVjqNYuL16LLg=;
        b=JEoVe76FvnCgIQb75Jlzl38XvnqmaC08agMtp4ogv4Jh5Z+Q+b3F+t1QnB0fu8qNaB
         IDvBBdzEF4UiwrEqHksX08lyGoMUKwY8JMfhSnHb8q8YozsaXupDeM66L/IiKnyCRf7U
         6fMt7+c7rTVvaQiwW8U7jCRppVXA/E58FEzs+TXUvtGFnNBzd/5b5+FgMB7RtcjtPd1A
         zvFVVwdx875qj5cWv9atmPB5TvDfjdg4lTOuFNndSshTF4vs8NBthQa+ThBitLY95LgS
         ji4zbHBdf3mMxBuSSaSpg7Yu6PY5A/Kfflv7F2fPTmMN7jrxd8KCdKMGX0ScAlhGNOPW
         xrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671879; x=1796276679;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VFb2pJiY8iJvPy2vop/0LNRFAle+KcEVjqNYuL16LLg=;
        b=Qz5cxd9ftVwJP3O3Wo1IY23nC+84innPkC0h/QyBjU7xVznw0Lb8orT+MwHVD++z8l
         tIo5vsycqSxpmD0jJwaEv7BzrsGzKxOhChxSVRAPhP1cOfSj3esmXtig99Wt8yVnHRDj
         +dMWEytdXgGaQqX9Fs3XyP1KpFlh4cfjXukigg7RxYJARzw44MRS0PKPPSfTgarS3kwm
         LFfZxXX2Gc8mdxrkP0rD7jFdkFb+0SqzeLEfQHyrbilnA0U2VXbyMy+dig/uKkkFApCM
         pPQ0pBqizKBrnKtnOGZSQlpceMtav4kDmZlJgyZOXyyIvajNSOEgfYkGzqwQ9gFJO8j7
         wBbw==
X-Forwarded-Encrypted: i=1; AL+hErGJyqxk2iJ1Mq2+SO5ID/W9JoxB14wA2fuYQW1H8dyqsLiCDUZm0hiE1s1Rq3XyN6vvtInxa1glnAqN1iU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3/QQePlD3VRpcInQnczsohsJpBsuY6j8rs50Pw9DlzifJkDfL
	rXuk7+Z/eJW0ZUuGSNmx/si6kSX1GWiy4rbTuRWhOX6EehMn6o2RZ6RtMy4AT2Cgq0zIGDoGyJd
	jwJZ11phBY7g/9LFlx5jDfqw7JqRbNIUhDeYOY3iraK+AfZQRWp+jixbeZqKnxvPFV5Qlu7axND
	A=
X-Gm-Gg: AZFdTZfCH4n0w3J2xuz3DgAWhBlj4/wuuR39fpwMGF5L90lGl5fd/tiDAvAFJRuCI4w
	GERkJjHTtTrPGItYUH9toCfZ9B16yGq9mgl9qUNvwBaQv0ZmYujwseZsEURnuIbnhnzIdFgTinM
	6BW8otamseTSfiA14TCJ+oyeVi+sAvzXvfWKkoaDebALAfMvLZLih9TN6CBkW0ZJX5hD07DJUjU
	p7BeK2m/lc88W5laMti4uxCKqmEHedjJbxcX6TP2gcRLA7VulRw5ubz31kbf+Wm0d+Uu3QLmji6
	8BZGhSgSuD4R8n7sTp8hYdB2r6t3s3ow+460A8vTwtVCsaBcQlpdQ15CEOYEC3f9MvKhh+ZAsqd
	aLoJAsqO9ohXGRCoy3/enFz/FcCjaevbTePBJzCNK+y2Q1OPfX8ngfnbLUeQmYAF1+LDDhuRGQy
	psp6cmuhn0
X-Received: by 2002:a05:7300:881a:b0:385:8aea:11bf with SMTP id 5a478bee46e88-3858aea13eamr23856384eec.41.1795671879278;
        Wed, 25 Nov 2026 21:44:39 -0800 (PST)
X-Received: by 2002:a05:7300:881a:b0:385:8aea:11bf with SMTP id 5a478bee46e88-3858aea13eamr23856368eec.41.1795671878754;
        Wed, 25 Nov 2026 21:44:38 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm50629223eec.19.2026.11.25.21.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:44:38 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:14:34 +0530
Subject: [PATCH] PCI: qcom: Skip ASPM enablement walk on resume
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
Message-Id: <20261126-qcom-aspm-resume-v1-1-a34625656e92@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEHHB2sC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMz3cLk/FzdxOKCXN2i1OLS3FRdCwtDAyA0sUw0SFQCaisoSk3LrAA
 bGR0L4ReXJmWlJpeAzFGqrQUATxA+rHQAAAA=
X-Change-ID: 20261126-qcom-aspm-resume-881010149a0a
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795671875; l=1969;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=qJc5dAwf+4nEm79Hn0JT1EAcYLvIUNn0CgyoUbmmUIw=;
 b=KZKQe6mZ+/o6KQhYDSrra9vXGpsBHnF+2+4hQqG/qtHFez5T+ebgYZlGe7VwbcFDkvrh37vCZ
 qUMufJpK8T5AoyJLxlKsOV6HrGOyTCDYGNRS1TupdfGc1GGMD+qoPD6
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b07c748 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: kBsr19OQKN8gZd-V7JeP7nBMcYY58nK7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfX3AoHnKRAZy+b
 0PAi0JxIfBiLcA5/2GCWJNGUTEAM/jhV7tWWAf7XMHo0SCLKA7JCgYKsUNIZIsZCaMR+EOsbKeo
 RnHjcA0TKO/OGrIwEkMEvdqrsOMzVlQ=
X-Proofpoint-GUID: kBsr19OQKN8gZd-V7JeP7nBMcYY58nK7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfX1E0xuBT3D6Z7
 hbCQ+5mnOo+nn+lNNS6W1A0mj5lEAk6kiIn4iggppzm/7k/Ht4auY0EP9kdQwD5z04TIJg/0iXp
 VeXCwsE9bB6/bRsYcfVikiNI/kH03mSJTl25RLKRA8Njbs7NHfYOZASQurMm3I/yQ5+1LB9l2fV
 GB4eutfodV3Agvf36YWOKfgWuKPk5c5++5SeRDgDAZ4c66Ze2E8UwcL/J/lQi8CsGS7MW/GLFWG
 3c0rybIGzrPvaHFAgdtWHmTQku8HkH4g+DoupqFvynaeQhytHmaMKnOKtg2+hTes7x+EjK4YKxN
 rnWV0cwg1TuvQxcO8ZGGR4dQsn2OPdDhK6ThuAAXvFPAryhwORy14zXLX6bBLnOuJK61W96foFj
 irrEilgGKx/gHkqB3AXEdr1gjmdleJRYnIR+pPH8XLiUjuE3R4drQ+/VQQruElrKN4ExyUYTVq3
 7py/2NuznhyrOJUAJNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260021

qcom_pcie_host_post_init_2_7_0() walks the bus and calls
pci_set_power_state(D0) and pci_enable_link_state() on every downstream
device. It runs from pp->ops->post_init(), which dw_pcie_resume_noirq()
invokes on the resume path in addition to the initial host init.

On resume, the PCI core has not yet restored the downstream devices
saved config space, so the config accesses performed by the walk fail.
With a PCIe switch in the topology this is easily hit, producing errors
such as:

pcieport 0000:02:01.0: Unable to change power state from D3hot to D0, device inaccessible
ath12k_wifi7_pci 0000:03:00.0: Unable to change power state from D3hot to D0, device inaccessible
pcieport 0000:02:02.0: Unable to change power state from D3hot to D0, device inaccessible
pci 0000:05:00.0: Unable to change power state from unknown to D0, device inaccessible

The walk is also redundant on resume: the ASPM link state is restored by
the PCI core as part of the config space save/restore. Skip the walk when
the controller is resuming, which is the case while pci->suspended is
still set at post_init() time.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index a6a0e3ecd921..bd1ffbf5c21a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1174,6 +1174,9 @@ static void qcom_pcie_host_post_init_2_7_0(struct qcom_pcie *pcie)
 {
 	struct dw_pcie_rp *pp = &pcie->pci->pp;
 
+	if (pcie->pci->suspended)
+		return;
+
 	pci_walk_bus(pp->bridge->bus, qcom_pcie_enable_aspm, NULL);
 }
 

---
base-commit: 647e1e846730c6aad27e9b858df292f5d4377f63
change-id: 20261126-qcom-aspm-resume-881010149a0a

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

