Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943124;
	b=kdbDuuYDhjE5NICEhc/iyTeQzRcS/IhbET6sF/J9VTwRgIin50yr0N8bw8gZzAPc1CLJ
	 4z2eGRZfdSovTko56xsAZL/DutkGZGaqibEJQRaasmkEnAYEgj06Hlep4AEcqAfN5fEVY
	 Wo60ti7Ty0JzFLTbnAVduZvaWsF1cum8Ct7EhU6YGIwWRhfcFK9s+gqlax+DxXojhWM7t
	 2RM2xPgxlS31wBotmy6nvMVTmfJrycwbVoJL7RS0mOU3nrL7C/i6gVLbd0vKBRb4MZ1+p
	 phsGMci/yZ+fNdSKVYjhrb1npgluLN76tr/9rZIyVxMi4foLgQmAEx/hQ8bMIckudSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943124;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GaQSv5LOAaWgMMW91Y0FIj2Kx8nuOneYwSDf3Lbil/Y=;
	b=DXcJbMWCO+th4XBxKRNlxpWHjYMFHErN+yzrpIBdJV8IoWRP6hdXFGI/NEjcYII4ARhg
	 IY5N7kMnwODsAMLIBYlgskSrZpgwZYQJJ3zVY+M/KZErXKSOCQ3OYs4IbFZFnNYrdOfpk
	 WqhrtSllu3lTMbHoKcIgxqpj/BiUvozxI6stSwwUyUyVD6jZOyqxr5xGo47lzWQCqqqv0
	 TQkG0u+pmTadB4OsfBs3WRbOX53j4ANDF2h1/MfGTXvjjsOHNf63/HKYfzxmErAuPuy44
	 DHdK8WjFYD6Bf3K1iMr6y81OnyJ7+sQBGdOi1zXw0LLNw4Oz4IxdjJSq5P8yFmMZReA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oPwX6flA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ezigS1pi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488EB606A337
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 488EB606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oPwX6flA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ezigS1pi
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ6xIA1033130
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GaQSv5LOAaWgMMW91Y0FIj
	2Kx8nuOneYwSDf3Lbil/Y=; b=oPwX6flAnTAwh+/uARVBqxP1C0LyxbAfWdGvYP
	c4VphQYuq/DnNblDYOFrwc/++j0QhhDnNQRM04x9gjdAtiEQtRoBEhbHYj51c9VD
	wJP54bnOhx5y4LzARYJfeGqSGqE09AWX176h9I/2dnGTFLx6O8IU9+pGcV14R5Gz
	L8WPtnRXf851/exBGo+J42u+IK2NLKI8B+1BAxx8ftpVzgwGbCFIsMkkwZqpr+Gz
	Ih15V43Pq6/vjes00gQ8WeZtwnMci4TdP2jcm6t8u5qeY3VJTDhqktM9zCIyoi27
	p1F4lPN2Qmxk/FRlaVwSDCQIlJ5MyDoS0t72j1h7084fBa+Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0gfr3fk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:18:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f2a3f40c3so16246eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794943122; x=1795547922; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GaQSv5LOAaWgMMW91Y0FIj2Kx8nuOneYwSDf3Lbil/Y=;
        b=ezigS1pi/GjaSGrBqO4pwbFACwB6GjGLnAo5B6hShqcE7WF5Ll8ZOa6mBsgnilGtUZ
         U6i9ietxiXn1pENh3HbY+DKT583CB0okQC1/jvltMHToWDHQtKjjthxfzMNdBBFwxjDc
         ymGvj/Vi3yxO1jkpg/L98cfhNCPRnWml2TMXFv+DOqfj3FPfXfAFsaIGJUZRX9D3Rugz
         pQboCYtIYP0WLAD3NGfqJDQF6AfIsjAajDQ7HYFAQHsNiGcjSqJ8zvUK6W4HDezX9uCn
         VRuMHPFq0an37V3ZSJKiIUsS1bljTCuWiDRGMC0MFRQbCPkCU+wvR3dkTRXO6fc0SZKU
         O5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943122; x=1795547922;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GaQSv5LOAaWgMMW91Y0FIj2Kx8nuOneYwSDf3Lbil/Y=;
        b=sd3nLjG5xU++35Iiz4Q5Q/+AeijBoDfUcFj2GOniM5Ly6t/+CxHVAWd1x2ZyJ/HM4G
         i7jcV7AGNl8xJJ/6WNj8cv/K4w1lzS65MuiMyYTxeh64hCf6s/N8gNEKhI/Wu6MbdDxt
         JHbGZHVHtwdy2XuKWKmOxnZYTsYKWqfYXzYE6JHiyK1MdtkPAaYMY+z1ftdMksnZxbTa
         SFFN89GGdI1MqyUmFwuIP/BkXGzk4sHsAIeHvztX4SdYuHvpO3vtnDjObkS03mwLwP0v
         JILPwvnVnySq3+8aOu5WUupjlBH5CZf2Ka6q+pj0vCvfVrflMM6LXB7+62vWOuBNwG3T
         K+Uw==
X-Forwarded-Encrypted: i=1; AL+hErFzRymr9MSH/Q11gYYvYH+E04w6ePpgLWTXtqY/gqRr4EXkhFT+O25EKgmulFyJ297fSE7zmvk8qZCvlgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z//mL51SaxSyCjdKJORSjtnV3yanzc/kE2pdvkdr6hCefLB+fxv
	K+67mbDrOavGUYQE4yxSN0j30O6ClU5YbWnxI/HaDSJ+kc4EGivo9gg+65ckauGICvd9h3ht+Bm
	JQc4ydU+LLStcQHmSp0tq1WXij7JUZi8HjJZKXf53H2TgVvvvsfD2ftBJdrFdMf3az04=
X-Gm-Gg: AZFdTZc6vYf1DrfEadv3VOlYyH5oIvlnWmas4hYJ/MLnYIWxZHdcT8/36jTsJtuw/KZ
	eQQc9fu3mVqBYyX2yTh8Q23s+rVwk1mAhzyimcdR8ocNQvqUFK5/DuvWj0eVAOCDOz6sTSN61yu
	uGdg7iQJeBd/VdW6fucAZbZdRcDrqZfmRnB3l1qjCvq/wcSUgkJXSnrnb51HXGQ6R1PHM55NEiN
	p+eGAZ0vpVN33wPwCsMFctYovRLtGEbAzQXqslVrTQ/PF36ORm5btNT840+PH+/6wE5Z97Tl59V
	u2UkO0NXVdNKrBVvTZ5KOQZaojr1PTgdFS3hHrJMJXmceLmr7zitNrqb51CePO9DhntrXIOyKO4
	0ikbGnJ/FZpyD1u5jfjTjKUFXWmAJrX/6oISchF64dhwFU+uAWOzd23fQCTJVw6lgcfr/sy9O/R
	/idQR5
X-Received: by 2002:a05:7301:4610:b0:35e:d21c:f33e with SMTP id 5a478bee46e88-3827fc8280cmr545827eec.1.1794943121569;
        Tue, 17 Nov 2026 11:18:41 -0800 (PST)
X-Received: by 2002:a05:7301:4610:b0:35e:d21c:f33e with SMTP id 5a478bee46e88-3827fc8280cmr545748eec.1.1794943120560;
        Tue, 17 Nov 2026 11:18:40 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059f8sm32197eec.9.2026.11.17.11.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:18:39 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Subject: [PATCH v4 0/5] arm: ras: Add DT frontend support for ARM RAS
Date: Wed, 18 Nov 2026 00:48:19 +0530
Message-Id: <20261118-aest-devicetree-support-v4-0-936587251e8f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHyo/GoC/42PQWrDMBBFr2K07hhJiew2lJJ7lCzG0ihRsS1HI
 4VAyN0rOz1ANwMP/vzHfwimFIjFoXmIRLfAIc4V9m+NsBeczwTBVRZa6k4aaQCJM7iatJQTEXB
 Zlpgy4K7X2n1IUt6I+r0k8uG+NX+fXsxl+CGb17o14VOcIF8S4f8MNwUSnHGd92i9RHOMzO214
 GjjNLX1/HkTXUsdkl9yMREzbkMOzedm6aSWvTJ72e56pYx+BwU54JxKcHE+H8cwl3uLYxhwwLX
 4S5yez18idAcNLAEAAA==
X-Change-ID: 20260505-aest-devicetree-support-a3722d90e1f5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        James Morse <james.morse@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        Avaneesh Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794943110; l=9296;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=045r5GLDCT/vyBB/sfB8h1g5qbGsdR0506gKqwfNhEw=;
 b=hwy9DWSIrAhJt8K0i8T9o7G9yh7SjwkdlvOuCD18iYq+ZT5qMpUuzRekRqWephEzCnB6KSmeH
 z9BewEwg/CbASeIYuAw3pzCA9P4w4e6UW720+wgLvib+RqTTgBI9EqZ
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Authority-Analysis: v=2.4 cv=X/rHu2Te c=1 sm=1 tr=0 ts=6afca892 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8 a=JfrnYn6hAAAA:8
 a=46B-utsBSRgbJVpin2wA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: mp1aUa3LMKANNBFwEwEYha7ODWYSlSvi
X-Proofpoint-ORIG-GUID: mp1aUa3LMKANNBFwEwEYha7ODWYSlSvi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfXw+G5L2mAxVXh
 I2yvdGbaVS1xNz+/KS8n7NvQER8l09ExK6/MeFGsXfRfarJw7q2FdqWoP427p7Fwc4TkfA170T8
 JHntCngcONfNRVMq2Ux6JASnin9o8M56YHdUla7DR2d+/Q6aC6nttAtqcs9ZVrlEXfyy4x4muL9
 V9y3Y2AvuJGyZvdAyklx2coJa/G3I3eWJFKqquP61he2yZqWMfynFIlxXFNG7ErtFx90a9XkY6O
 hSZHEHbpjJP8ZVHKWzefPFx3TivoxSxhcsLCKIF98wDnS1++YcaujNxDi42eGfkgkV8TqLWZgM8
 09GhmbE+2tAmSR8qsRliLLZx2TPqGgXyAwd+RACyzdDA5NbcIUMBXubd97HB4FJiDkPofE9zShS
 KwyHXXHF/Lye/jqQpAxfKZyfp8GC6ruhphzTX8nwJR5VJjEzGM83w3tPl6UzvpL6C1Z2lCMtm09
 nY83sJXsyBpUFxahSlw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfXwJj0NY0HjKeA
 XzMnVrKuX3yjuXosMWXdMBSf17Xg+0dK+YmKimxXQKHNUJD7jJDXEYQ6pt2qn0FI7tGv/fZfAra
 9Y3HDEtslpQcXT00LwfjCWG88YqSJDQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170076

This series adds Device Tree support for the ARM64 RAS driver
introduced by Ruidong Tian [1]. The existing driver supports ACPI-based
platforms via the AEST table, this series extends it to DT-based
platforms without any changes to the core driver.

How to test with QEMU
--------------------------
Tian Ruidong's QEMU fork [2] emulates AEST MMIO error records on the
virt machine.  To test the DT frontend:

1. Build QEMU:

     git clone https://github.com/winterddd/qemu.git
     cd qemu
     git checkout c5e2d5dec9fd62ba622314c40bff0fbecb4dfb34
     ./configure --target-list=aarch64-softmmu
     make -j$(nproc)

2. Build the kernel with:

     CONFIG_ARM64_RAS_EXTN=y
     CONFIG_RAS=y
     CONFIG_ACPI_AEST=y
     CONFIG_ARM64_RAS_DRIVER=y
     CONFIG_ARM64_RAS_DT=y

3. Add the following DT node to your virt machine DTB.  The QEMU
   fork maps GIC error source at 0x017a00000 (SPI 0x0d).

   ras-gic-dist@17a00000 {
       compatible = "arm,ras-gic";
       reg = <0x0 0x17a00000 0x0 0x10000>;
       reg-names = "err-group";
       arm,group-format = <ARM_RAS_GROUP_4K>;
       arm,num-records = <1>;
       arm,record-impl = /bits/ 64 <0x1>;
       arm,status-reporting = /bits/ 64 <0x0>;
       arm,gic-ref = <&gic>;
       interrupts = <GIC_SPI 0x0d 0x04>;
       interrupt-names = "fhi";
   };

4. Boot QEMU with acpi=off:

     ./qemu-system-aarch64 \
       -machine virt,accel=tcg,gic-version=3 \
       -cpu cortex-a57 -m 2G -smp 4 \
       -kernel Image -dtb virt-aest.dtb \
       -append "console=ttyAMA0 acpi=off earlycon" \
       -nographic

5. Verify probe:

     dmesg | grep "DT RAS"
     # Expected: DT RAS: registered 1 RAS error source(s) from DT
     ls /sys/kernel/debug/aest/

6. Inject a CE error via the QEMU MMIO fault injection registers.
   The QEMU device accepts 64-bit accesses only (use devmem with
   the 64-bit width flag):

   devmem 0x090e0808 64 0x40000001

   This triggers QEMU's error_record_inj_write() which sets
   ERR<n>STATUS.V=1 and asserts the IRQ.  The kernel driver's
   aest_irq_func() fires, reads the status, and logs:

   arm64_ras: {2}[Hardware Error]: Hardware error from AEST gic.90e0000
   arm64_ras: {2}[Hardware Error]: Error from GIC type 0x0 instance 0x8005
   arm64_ras: {2}[Hardware Error]: ERR0FR: 0x48a5
   arm64_ras: {2}[Hardware Error]: ERR0CTRL: 0x108
   arm64_ras: {2}[Hardware Error]: ERR0STATUS: 0x40000001

Testing
-------
- Validated Processor error nodes/sources for L1-L2 and L3 caches error
  on Qualcomm's lemans-evk, monaco-evk and shikra-cqm-evk boards with DT boot.
- Validated CE and UE injection via debugfs soft_inject.
- Validated GIC and SMMU error sources on QEMU.

Dependency
---------
This patch series depends on [1] and would apply on top of it.

[1] https://lore.kernel.org/lkml/20260122094656.73399-1-tianruidong@linux.alibaba.com/
[2] https://github.com/winterddd/qemu/tree/error_record

---
Changes in v4:
 - Changed arm,cache-ref from a single phandle to a phandle-array to allow
   one error source to monitor multiple cache instances. Updated DT of
   monaco, lemans and shikra platforms accordingly.
 - Link to v3: https://lore.kernel.org/lkml/20260918095746.3347893-1-umang.chheda@oss.qualcomm.com/

Changes in v3:
 - Changed dt-bindings filename to "arm,ras.yaml" - Krzysztof.
 - Dropped irrelavent nodes from dt-bindings example - Krzysztof.
 - Changed node-name of ras-error sources to generic one - Krzysztof.
 - Updated commit subject text of dt-bindings to drop redundant
   "bindings" keyword - Krzysztof.
 - Drop un-necesarry nodes added in Phandle description - Krzysztof.
 - Fixed reg and reg-names to be same number of entries - Rob.
 - Replaced interrupt property description as suggested by Rob.
 - Defined the order for interrupt-property in bindings - Rob.
 - Dropped re-defining iommu property in the bindings - Rob.
 - Update commit text to be more elaborative and, change the ras node
   name to be generic for monaco DT change - Bjorn.
 - Link to v2: https://lore.kernel.org/lkml/20260720081954.1858180-1-umang.chheda@oss.qualcomm.com/

Changes in v2:
  - Rebased on top of Ruidong Tian's v7 RAS driver series and reworked
    the DT frontend to match the new driver architecture.
  - Moved RAS error source nodes to the DT root, removed the arm,aest
    container node as suggested by Rob Herring.
  - Dropped arm,processor-flags and arm,resource-type properties, these
    are now inferred from the interrupt type and cache phandle
    respectively.
  - Renamed compatible strings from arm,aest-* to arm,ras-* and the
    dt-bindings header from aest.h to arm-ras.h to avoid ACPI terminology
    in DT bindings.
  - Link to v1: https://lore.kernel.org/lkml/20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com/
---

Umang Chheda (5):
  dt-bindings: arm: ras: Introduce ARM RAS error sources
  arm64: ras: Add Device Tree frontend
  arm64: dts: qcom: monaco: add RAS error source nodes
  arm64: dts: qcom: lemans: add RAS error source nodes
  arm64: dts: qcom: shikra: add RAS error source nodes

 .../devicetree/bindings/arm/arm,ras.yaml      | 235 +++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi          |  30 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  30 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi          |  20 +
 drivers/ras/arm64/Kconfig                     |  25 +-
 drivers/ras/arm64/Makefile                    |   2 +
 drivers/ras/arm64/ras-of.c                    | 383 ++++++++++++++++++
 include/dt-bindings/arm/arm,ras.h             |  11 +
 8 files changed, 731 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,ras.yaml
 create mode 100644 drivers/ras/arm64/ras-of.c
 create mode 100644 include/dt-bindings/arm/arm,ras.h

--
2.34.1

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Ruidong Tian <tianruidong@linux.alibaba.com>
To: Tony Luck <tony.luck@intel.com>
To: Borislav Petkov <bp@alien8.de>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Richard Cochran <richardcochran@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
To: Rafael J. Wysocki <rafael@kernel.org>
To: Len Brown <lenb@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
To: James Morse <james.morse@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-acpi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-edac@vger.kernel.org
Cc: Ruidong Tian <tianruidong@linux.alibaba.com>
Cc: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: Avaneesh Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

---
Umang Chheda (5):
      dt-bindings: arm: ras: Introduce ARM RAS error sources
      arm64: ras: Add Device Tree frontend
      arm64: dts: qcom: monaco: add RAS error source nodes
      arm64: dts: qcom: lemans: add RAS error source nodes
      arm64: dts: qcom: shikra: add RAS error source nodes

 Documentation/devicetree/bindings/arm/arm,ras.yaml | 241 +++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  31 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  31 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  20 ++
 drivers/ras/arm64/Kconfig                          |  25 +-
 drivers/ras/arm64/Makefile                         |   2 +
 drivers/ras/arm64/ras-of.c                         | 383 +++++++++++++++++++++
 include/dt-bindings/arm/arm,ras.h                  |  11 +
 8 files changed, 739 insertions(+), 5 deletions(-)
---
base-commit: d10c791977beca9c8eb81dd03efd55777ae072b3
change-id: 20260505-aest-devicetree-support-a3722d90e1f5
prerequisite-message-id: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
prerequisite-patch-id: c8c674cd9e8b68486347f19c71cb9c11d4b09831
prerequisite-patch-id: 5bc95e47517b7597d4603662fbe11c1d31d272e8
prerequisite-patch-id: c72f922a339668986c191ed12e792a4784af3f08
prerequisite-patch-id: 8bd8f5ed05bfac58c778654c8b0c3577972397c9
prerequisite-patch-id: 842ce0a9003fd87e75715347306d797eb5b1ff02
prerequisite-patch-id: 6594536ec718a7981ff93e6d85ab531ed24b4d25
prerequisite-patch-id: dd71ab164d5d3399bde25e404588ed6f6669ab55
prerequisite-patch-id: dff9db8351b9a193c5dc801ac7c8ee06c891a74c
prerequisite-patch-id: fef1e3186a39a30478b71b7f4c232fef431544df
prerequisite-patch-id: fe754e5a382d7c3f33306f85373004c25729dc24
prerequisite-patch-id: 35549125a6faf998cca1da839cbaaec91e1f1053
prerequisite-patch-id: ca534a6b3f0a3b6a128c63a98c17f46df33cfc1f
prerequisite-patch-id: 77155854bb50f201f40f0162dac3950e4c70feeb
prerequisite-patch-id: 4b3384708df07f1e1bf4a594629646788b55e56d
prerequisite-patch-id: 3db590aac7fca6eb8b65859d8afe323b70c27127
prerequisite-patch-id: 8bff2ba472e02c81dca7c2d9673caa06adc40b81

Best regards,
--  
Umang Chheda <umang.chheda@oss.qualcomm.com>

