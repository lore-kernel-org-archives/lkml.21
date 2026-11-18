Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982026;
	b=P70vRX3vH51RbEC5aq0Lq7Zdc/B78Qxdif1BOoDaiFNofDmRoggLlzJkG4BHZTkV4QB5
	 QJTX3O70DWnRUvERLs1yY377Loc8/1B22yBwWlRo8/JvwQFzI8u8TKcpUPn193d/Smt3i
	 Ek45rSg+06EBy26mRw6Vr0gEP6cX+STmz1fFPnbUUNf9TAoN43crcWjnkIVwfGsSP0Qht
	 Qp2zWE2Nt5slrnasJNaF/s+LukxVFC0Duum7AvGib+L7qZ/4cAqR4w42nhvgPoPh4m4pa
	 3CjImW4xQqRtvx3AOBIore+S3AX/+bgqwF8kHNgYbEXsENIHEFGffgF8huasp+yr8LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982026;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yOCQbA2wY5BnvDNCmEwPpHQ2C1R6OpFI9nR4EwL4mVc=;
	b=oOqv6EyWLWtL2RZlc1LrLctpvgqXp4FuS7Gk+QRxzdxslCslSjr8kpHmwg1ngohRiUHH
	 6+cxPScLLXRoLHLwYFlIl99UVZ2WUoi2upXdA0cZK+ns3DgojMeZ97AMAhIwtAJDkq04e
	 DKg4w15efUfJVdkyNJ0EhVHlqkUp2KuKlEfz+sL7cY34PsdF6wC1wONZUyuREvvtDF7ea
	 gA07A9EAMwLQ3D1reSAoOybF/F/pbtNfLdJ+kbjmC20zHRt9thUsYrk1wda6fPVp9xyuV
	 iDk6r7LpF3W0+QOzPiYPzL+pNIEgK+w1gHceHB2E6Ov9Vy4hr3jsGvD1JXC/tUtAGUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocFocBd1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1Vs55J3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EC0606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87EC0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocFocBd1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1Vs55J3
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V1qB1430569
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yOCQbA2wY5BnvDNCmEwPpH
	Q2C1R6OpFI9nR4EwL4mVc=; b=ocFocBd1+X/sFdLPGnl5ewkR9MWzKhmO8zM35z
	Z6A7DBz6+yIvrTICliYcvxBWbMdLulaXxP8wuOHig/o3aUvET/YjG7pHn+aqHPDj
	Le3hkvPqg2acr5gM3e0czCHTsAYnYcqtShHsQzusIysyYcYMDambB1POfCIyvVSQ
	UZ4v4g0oJyhoClg7KCmeeegBvkryzmBHtoqhRY90cGaaSQi5H6eQH+o8A0CEmPe3
	DG77vGcFwHJFsuxjl5MRCpt3r/AwAr1/5ODFQbZI3ot3x2bTS6E4Vvyb0DLBJNbC
	62sOIWTRa/ofEleMpx0trbiQi90O/pkOe6UhoLR+79KeUmEw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv91fu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:07:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b175a69ab8so651548a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982024; x=1795586824; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yOCQbA2wY5BnvDNCmEwPpHQ2C1R6OpFI9nR4EwL4mVc=;
        b=L1Vs55J3Iyqg2BbaPOj172i8z3Y5YLke5TrCM3igEkPqLyk7cqvmlq2SyjUwRbEleo
         c5BZJ2uVDHsMI4jtSDg2RzQmEXzHlzbGawWjYZEKUUsxzt1YCUIxj5pUPgjIpF2JhvyV
         xs2U5Y24pd+/TgHLiHTJLnN20rX81wQxwV6NlFQDkyhlmdyBIFaJGswP+Bv9pXw4viU5
         j0zxjiOVMMlkJRqnkT7y/7oMXr/6WMu9A5JrZDN4kgPEDrb6HyWHTFqRFXgfhEscPIk3
         /edmMmUJ60yILsuDqRP6/Yr4rLShRNpgcpqfeipFHTeBfHUZ9BFaPL99+31XYtdXIzLp
         qP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982024; x=1795586824;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yOCQbA2wY5BnvDNCmEwPpHQ2C1R6OpFI9nR4EwL4mVc=;
        b=Zy1xF5IoSNI8986YIWyS3bvdnKUT0E+/rJlf97zuvH3+1N9ybC+pYsYFHu2P8tZzwI
         8epq6vH2xxVhq+v6KDjHNKy1Mywo91vEL98EIv0QnWxM9YQbYGbTv4Hv/kB6ZUe+jqjX
         X6sHGA1G0rNho0ZP82qjwYPzgWoEkCEWS9Jlay3brPfarIptvuJH/nJidErMgCnWzHdi
         tthJ/Z6rGvY40EWtNRP348XwtxG0X0dZnvMBCM6H0nT11oBzBauuChMDu8JYYcJhRekp
         QwlQ8z0ciBGecXLdxCQW41+hILJ2YGrmfCZt6t8cVJgMzAlnuhBrnYWbEyReQYpN0cCY
         xrvg==
X-Forwarded-Encrypted: i=1; AL+hErEuYIkAbsMiybExvwnMYXsw25Vd6EgR6YlJWEAv+8C+k82HeRCRnYLRZbwF1aA6CTlpEmM5HNX97I/JkLM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/36C8UjQbOUIMLcuTlDEY9wT1d46EWqy8c1RPW2kgoiWc/Gai
	X87dZpmwRMUFS7X4Rp52yEEwA6cEFbmdAngVyAxCp54ApLVygJlywqKSyAcvUskrdYR/CkFlSka
	v+CS0dbff+5pSzADhpDXcQ+d7EkK2KXNkiXmK/jJ3s25Urjnn734tkd4/UZXp9vD3aCE=
X-Gm-Gg: AZFdTZdKkpz39osIoS9AmHe6a1bhkIuZx+0ttgZi0W7Sp/cIdfGCQ7032nfEbxHqw68
	ShM5RHqaZuXeQpltYiYjUTJHehUAffrWAXrbB2wYXI3+Y6mhj2G7iFoRj3tET8xGqnY20gYfAfX
	MnnDF0iGfkYgdgi91Bh4nq9JuALLBLURvuXhQwP5PQGo3U8+V29JACC5aqahSUdH1fdNNLTtGUM
	JN6aa4dmUZ/q3JkGZ8G0hGt6kYMoGp68raT5jMCnejCCO7lRkaLYwEKzXFFFZbW/Dh187gwNu8q
	R5Wuf1s0xwUuls7TTxDs3yGI5cGaLh04Je0PI8SoDg6ZpDG6+93OILr6VxXKFLq+4Sv4CoaO42b
	a8aM53iC4f/QABLAaMEVJMQPcGykqRc0kXwxuBw6qHwIrnjYtHHLlHhaF4HA1WEWFw/Y083xrFp
	hXlFY=
X-Received: by 2002:a17:90b:3890:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3b3d07d52bemr1757186a91.67.1794982023759;
        Tue, 17 Nov 2026 22:07:03 -0800 (PST)
X-Received: by 2002:a17:90b:3890:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3b3d07d52bemr1757168a91.67.1794982023252;
        Tue, 17 Nov 2026 22:07:03 -0800 (PST)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abb786ecsm7476382a91.2.2026.11.17.22.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:07:02 -0800 (PST)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Add fallback method to handle RPM notification in
 MPM driver
Date: Wed, 18 Nov 2026 11:36:17 +0530
Message-Id: <20261118-b4-shikra_lpm_addition-v4-0-46ee87e22576@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFlA/WoC/3XPTQrCMBAF4KtI1kaSSdpGV95DRCZ/NmhbTTQo0
 rsbFcSF3Qy8gfcN8yDJxeASWc0eJLocUhj6EuR8RkyL/d7RYEsmwKBmNW+oljS14RBxdzx1O7Q
 2XEqFSlxqo0Cjd46U8ik6H25veLMtuQ3pMsT7+07mr+2HbLiYIjOnjAqrKmU9GK39ekhpcb7i0
 QxdtyiDvOQMX40zXk1qUDQ0jefIbFULNaGJHw0m382iaBIkamONVyD/aOM4PgFl3JlUXwEAAA=
 =
X-Change-ID: 20260617-b4-shikra_lpm_addition-4a9bc82bafee
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794982017; l=3315;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=PRPGaYLGmhNCUHjIssf8urCHwf49nXM/4eEJNt3ORxA=;
 b=EOohxv1ZnOJUxvyvaTp6btqK3MNGqfePG9Pi7+5ki2K19SbkUJM2hFpxvgve1ZKveGwU5OPA9
 OJmGKGltEwnAtzn5OiFdoRv3G0qvfPM5LipyJ8DKCk6/jhtN2mvU6WM
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXzhuYAIL/t/oj
 7tgFMDZRydy2LxF4fuOVJx8sRbDor+MgUDdkMysKsLlAqtaCDX/Q/VVaYck+DkMtGY0C+R4faWh
 jHLGkYrV3fevWEdEw6gKP+3WwjCeo7VUu/4e3bsa+jcEOqZN5CKJbI8anRV0KWO/nQMrOdfm6iU
 Hb2YOoV6QfweVVlqBserr7yog2MeC90cSDVoo7flJk3uiZLhRWeuCbb9qY8A9AQSMASW8LBLec6
 I1YvAVNR7U0TKeCl/wx2HZh6cb2vnr1dyZX6W7nan5jGfN3C5FEUIlaDiptS/0uETyd3n87PMBp
 wzX3aWudnl7CprhnZ/NJpoQyEmX51BSZiek2euf68RdmsSdycdLIcSdjbHH8bCZO/SVM59mJlpC
 FNEiIFtbIGeNT58jvftpaV3s8oMY5HHmJvbYHjaiuYs42vEwzLRYH6faoqQQdBpfq9xeImY4q8v
 0KL1lOob3+YMaL4F8sw==
X-Proofpoint-GUID: Bf1TP8dbFyCsiX9fjnqrpjh44h6yYbHf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX72qA/hcgQkAT
 fh3Mm2I8gcgeP3/eprHE8b+iRRqZkIpR0up0dfqdNvjG1bafB2PXySCA/nuBmrHrJfrIiawAsUI
 L7JMKWJPmzdNAd750mGy3OZ6mZoVZ1o=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd4088 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=-g7Su3eQ9jgtFDl0TfQA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: Bf1TP8dbFyCsiX9fjnqrpjh44h6yYbHf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
the latest wake up capable interrupts when the CPU cluster is entering the
deepest idle state. This is done by sending IPC interrupt to RPM and is
implemented as .power_off() callback by registering MPM as parent power
domain to CPU cluster.

Such implementation earlier introduced a hard probe dependency between MPM
irqchip and CPU cluster power domains. That is MPM irqchip needs to finish
probe before PSCI power domains are probed.

The above problem has since been resolved after bd7f488a8e5d ("cpuidle:
psci: Fix support for probe deferral by dropping the faux device") / [1].
However, it makes sense to remodel the RPM notification in MPM irqchip due
to general consistency.

MPM is not really a power domain provider, all it needs is a notification
when CPU cluster is going to power collapse to carry out the RPM
notification. We can register for CPU_PM notifications for that purpose.
This way we can avoid such unrelated dependencies.

We cannot register MPM under CPU cluster power domain and rely on
GENPD notifications here, since that way cluster low power modes will be
blocked whenever some consumer of MPM, and in turn MPM itself, are
runtime active. This will add another unnecessary dependency for CPU
cluster low power modes.

For now as first step, register with cpu_pm as a fallback to manage RPM
notification. Trigger the RPM notification when the last CPU in CPU cluster
goes to power collapse.

Add idle states for CPUs and CPU cluster for Shikra.

[1] https://lore.kernel.org/all/20260909134240.685115374@linuxfoundation.org

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v4:
- Some code correctness in the driver changes introduced.
- Link to v3: https://lore.kernel.org/r/20261027-b4-shikra_lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com

Changes in v3:
- Skip timer programming for now till we add support to register MPM
  under CPU cluster power domain without blocking its idle states.
- Skip modifying DTs other than Shikra to prioritize Shikra LPM
  enablement.
- Move genPD/cpu_pm registration after mbox_request_channel().
- Link to v2: https://lore.kernel.org/r/20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com

Changes in v2:
- Enable Shikra LPMs in the first patch, following patches concern
  MPM driver.
- Register with cpu_pm as a fallback to manage RPM notification.
- Move USECS_TO_CYCLES and xloops_to_cycles to common header delay.h.
- Reformat qcom_mpm_offset() as per feedback.
- Avoid deleting cluster_pd node in qrb2210-rb1.dts.
- Link to v1: https://lore.kernel.org/r/20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com

---
Sneh Mankad (2):
      irqchip: irq-qcom-mpm: Register MPM with cpu_pm for RPM notification
      arm64: dts: qcom: shikra: Add CPU idle states

 arch/arm64/boot/dts/qcom/shikra.dtsi |  93 +++++++++++++++++++++++++++++-
 drivers/irqchip/irq-qcom-mpm.c       | 106 ++++++++++++++++++++++++++---------
 2 files changed, 173 insertions(+), 26 deletions(-)
---
base-commit: 7777cc195ca1301a28008ca5cdb98bdb2a9d0def
change-id: 20260617-b4-shikra_lpm_addition-4a9bc82bafee

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>

