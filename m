Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943133;
	b=upHPElgn/9PZcAuSRgbtabMV1Irs5QtdPG1yL3XHokcm5IK81yyNvUyVO7yQdW3z4lip
	 QeU/zk/1yIGws0hVyjHCe7Hwzqy5arc8wBvlxJthvpzxYtqeSVE4BY+owJnpbazviSgGz
	 fnataC6JFay0t4XaCmBTGBOkHxIQmHCi3Z+aau/h2p5FP2Gld4ML9mQ0uQbZpdX5rLqp4
	 BhYsvy8apMHPlpf+M52NzouKAWhqs6K115f0B9Ux+fyYJ88PmanKsmXH2K01lVSuyYiE4
	 QOfsUSz4B9C6n7YPczfcahWOPhebUfPc5Ib8DDXLUiD00JSviQtL3ojtGLIxkmPGQIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943133;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6WtNEBbnNONmenOZy/udY419hxtAl9Rorvbbwtls2Jk=;
	b=AOYfp7CxK91GaZI8K81ysvAo4fJGjQxhHOxI91Vg2z1ZaFoIje5dVq0JUXnKMLarEznX
	 YXhA/pvzkD4HMCNFrZWpGqqMpogz5OUF2SDbCr0nb5hCp8DXweG/Bjscpz0QBYe+x+lif
	 88adiFNkswHAIe7kNpMDKGgmdLE66VODqHphS1rVuuemfYwZqhltc0s/iVMSvIDx87pkV
	 PBfxO1t3WbA7glKN+eXCZRxm35dCu702CgpGx0cEhYlYI9tNZXoeCvAOOYKdrOwT1z75m
	 eKZA54sMNMv5NDk3YBtPIYYYGdrPCsafJK1FIXjF0YIY0Ha1T5ZlHOhvub134xujkmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d3TXfaxo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SRL843rO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3B9606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE3B9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d3TXfaxo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SRL843rO
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ6Pfs2161079
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:18:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6WtNEBbnNONmenOZy/udY419hxtAl9Rorvbbwtls2Jk=; b=d3TXfaxohU+UGELs
	rUaS8C24inW+N1r8qXo1ev31vnfAzxglCnk7PBk92XhoF9xGsG8GrWZQ/CDuaIvx
	0MQbuXSpRZo6I1nAGIkH4A261xpoV3ge9aXIrdNrGu0vmNiWya5q4g8ehu/ufGWJ
	L83XsUworFJ6xABgRqfvEyzI0mzd2Qs4XK6yGcg5VFkgIBtNrs11K3QmEn12+pmc
	GuGBqAYMt9BvAtyTgXqEqvbMEe65mbJADf2lAD/veE9OSs6OC4fqx+q/x1oQYega
	2bsntFTvJZj7wUJgVuJRMxKl/e/3NqG65zmDnD/z6rnXgLe9sRVQHTyVckgROFlX
	sp75MA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0kccaqpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:18:51 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36db182e57dso15870eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794943131; x=1795547931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6WtNEBbnNONmenOZy/udY419hxtAl9Rorvbbwtls2Jk=;
        b=SRL843rOakQ954rocE/ThKXtQD8iz7loNCgrwAe4DiyziWTM4mW6/U10o2q7qSmB3+
         5Adah3e8ywigECk0oEhFERxK3fxmfM9Mz/TDK8rAKpDEjJxlCM+gDSpGjsua2O5nxUQ5
         naKPN+7J5lTsrZ+oPKch1xEPmFMTXOKKg+shFa2yQm92wyv86phDPUOSlhevy9uUvHWs
         RSakYDEyKe0uZPiOhXrxXfLLxl2yWLOKR8T6KbRXrAZXuRyftoXtMbiIxApdJ7a20hO3
         h8G7mhkKIjM7Ag916q7XONWX61CTurCcHAuEaztUicio2mRldrlpP/mQcVlqXutxGb59
         CbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943131; x=1795547931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6WtNEBbnNONmenOZy/udY419hxtAl9Rorvbbwtls2Jk=;
        b=Qx1Duja3Xj0rr6KNUS60UOASAGPprlXvkTeRKOqLjWc4+J1BZLxcPJ4aOWfZyCrcIw
         HezWDsyO9nfa6c94otb/UOSAZB+nGwy8HmKKRc0rcnHW7/6Og0YUg9txEhwuF7P1qfvV
         9q+A/j1MI0D83yk0dRquv0qaOJv+07KQ8Cb2QRgfaqSwmT8H8A7hi8Df1PPR4PzVFLkj
         Npc8fGVEGG5BwA2N9rJ0glprcZGNXugKWMhhTs8eIx2DzxSB35KMrpe9eJwsqeUWgJs4
         624fntLBy1egqt7Nebmv9RnhKu3Nx5dPV3K9GSRr1lB8AojmvZC8pZ3u+qY+AQJJqpXR
         U65A==
X-Forwarded-Encrypted: i=1; AL+hErGZTEU6lTkC4hoXYZrIMikT1K+RL2ldySrda4jONPEfEqFxSfXVpF4cFlWKmUvVp/gwJogCouY+a0fEpSg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/V2NYowB+HGhvqGDPdO/9YXEQu9f3WOFyfVoL88C4HWSKRczrC
	k7Jnu/cRD8uN0+LQbGsx4EeoutbYS60bT+R/3d3JXqKKvPNKWAGUGqTc2pL5lBYNr6AoycqPg2C
	6F3rJPrdoxYE+/GF4X8a2QBZ3L6QtBnat07hEQXITB6Q9r9iApHJLsb4PxKzOFD/a7GQ=
X-Gm-Gg: AZFdTZf8Qq5/DX2Yp36TAGZtogYtYdEg7gpjnEiVY8+iX72Ib3W0JVyBehVuyLwDpha
	Ek57Hfy+U/IqvDP2YFI8+zJHMAoa6kDiBbDAIKyuLX6Pe/DrtaKjAYMchHYa8b8mvz8Dua2i7eR
	3bMdX0iLzKwS1DeUH9kbx9DG6AoIknp1zdEN+89HSqM6uc3U70SiBCLgjV3ftstIlejKRGlix3f
	Hao2RQfIgfDjH89X8wbA3n7p66/b+Wk/Y882gD47c9uPpwGByDT7jyd3KYpGDxr6G1aySAjGtr+
	AzzRjmIyaRoozzVrJvrGbESZEMsDWLv55AJ4BnVD0FB17wSYj71LYXLhDpq8xkHvzeF8UHb/xu2
	250P8P8kYXAwWZZ6c3RzUNdjozxV+RQAB9nnCXY0dravziEfX5DO1h/ttlEQCjVF+XguT+KivHE
	UR9+vQ
X-Received: by 2002:a05:7300:ce88:b0:36e:66d8:1424 with SMTP id 5a478bee46e88-3827b0ca41dmr541541eec.0.1794943130212;
        Tue, 17 Nov 2026 11:18:50 -0800 (PST)
X-Received: by 2002:a05:7300:ce88:b0:36e:66d8:1424 with SMTP id 5a478bee46e88-3827b0ca41dmr541493eec.0.1794943129531;
        Tue, 17 Nov 2026 11:18:49 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059f8sm32197eec.9.2026.11.17.11.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:18:48 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 00:48:20 +0530
Subject: [PATCH v4 1/5] dt-bindings: arm: ras: Introduce ARM RAS error
 sources
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261118-aest-devicetree-support-v4-1-936587251e8f@oss.qualcomm.com>
References: <20261118-aest-devicetree-support-v4-0-936587251e8f@oss.qualcomm.com>
In-Reply-To: <20261118-aest-devicetree-support-v4-0-936587251e8f@oss.qualcomm.com>
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
        Avaneesh Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794943110; l=9889;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=79NjS3d8FLkHxoX2p2VWA63uMGScO/3PHtatyFaIXEo=;
 b=uf86oRyACdFsVDW/dEEUvCcvSDDZBrw3rFI3RVRe7znb15liCX7q1jett7B1hlljwmD49D5lB
 qS+iiOqhRfUBYpvWl20SNSWD56T5cT/IQcu8OJno9wmX5ZAPtDCNVew
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfX9R15v/MdCFSQ
 0Zg1iVWKUFRYtiFvPYY+xk1JYUunSyKNKpM0CjWJSuY0oOk1OD7raAN5kY2azM3nRq9IQakgmAw
 Jigyx39T+giG6/5cE2CP7L9Kd8OITj0=
X-Proofpoint-ORIG-GUID: Rxkeb2tyIxCKxAqrwmHocoKOvxdx7-o_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfX08ojqjBGQJ/Y
 HWYYE+WpfQHqiEiQrbpnbjyZ66OZKmY5ct/ZfGZY4w8xIyTha6WZxDNB/tHDmyLgjyMj/jLbxDs
 eHyi9uEdanzE+mmKrRtB0LBjRaEoapciDJLoGDwTy+JRsBfWSIhD9+ku5oawntKH3HDK5shpCse
 G/wE+MsysiF1Vfm9P7IgKOSKukdHIUnmZxsB+emWxJYZ+vI7NA2YHjZlbq/i10uVd974QeoTS0H
 GlD6IqAuWug9dfGth6vqiei7dl3xuzJTvLc3StgmTOFg84RVSbANixCKpst/oWxHW1CM96w03nH
 ZDnWNnfuRz0MFasAhy75bleJBwKoQfA/6jOjBdtokYXGeSBsowSOjVnISaEKi4vZXll+49Whwhp
 Wvt2QkaR5686CrRtPdLBqoVd7745oJse9cviFm1Yf/gmFbADvs20Tsf+Ifoi068nTZH/IJQ2I4r
 A8euDla5aHfiCOTS7NA==
X-Proofpoint-GUID: Rxkeb2tyIxCKxAqrwmHocoKOvxdx7-o_
X-Authority-Analysis: v=2.4 cv=ZP1CCn7b c=1 sm=1 tr=0 ts=6afca89b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Lrng1kJLq-4Mmy5ilNsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170076

ARMv8 and later processors implement the RAS (Reliability,
Availability and Serviceability) extensions, exposing hardware
error records through a standardised register interface.

Add Device Tree bindings to describe RAS error sources.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/arm,ras.yaml | 241 +++++++++++++++++++++
 include/dt-bindings/arm/arm,ras.h                  |  11 +
 2 files changed, 252 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,ras.yaml b/Documentation/devicetree/bindings/arm/arm,ras.yaml
new file mode 100644
index 000000000000..257a5f5375c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,ras.yaml
@@ -0,0 +1,241 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,ras.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM RAS error source
+
+maintainers:
+  - Umang Chheda <umang.chheda@oss.qualcomm.com>
+
+description: |
+  ARMv8 and later processors implement the Reliability, Availability and
+  Serviceability (RAS) extensions.  Hardware blocks that support RAS expose
+  one or more error records through a standardised register interface.  Each
+  error record captures information about a detected hardware error (cache
+  ECC fault, TLB parity error, interconnect error, etc.) and can optionally
+  signal the OS via an interrupt.
+
+  Each DT node described by this binding represents one RAS error source —
+  a hardware block that exposes a set of error records.  Error records are
+  accessed either through system registers (for processor-local resources
+  such as L1/L2 caches and TLBs) or through a memory-mapped register window
+  (for shared or off-core resources such as L3 caches, SMMUs and GICs).
+
+properties:
+  compatible:
+    description:
+      Identifies the class of hardware block this error source belongs to.
+      arm,ras-processor covers processor error sources (cache, TLB, etc.).
+      arm,ras-smmu covers SMMU error sources.
+      arm,ras-gic covers GIC error sources.
+    enum:
+      - arm,ras-processor
+      - arm,ras-smmu
+      - arm,ras-gic
+
+  reg:
+    description:
+      Register windows for this error source.  When absent the error records
+      are accessed through system registers (ERRSELR_EL1 + ERX*_EL1).
+      When present, each range must have a corresponding entry in reg-names.
+      The primary error-record window is named "err-records"; additional
+      optional windows are named "err-group", "fault-inject", and "irq-config".
+    minItems: 1
+    maxItems: 4
+
+  reg-names:
+    description:
+      Names for the register windows listed in reg. The first entry must be
+      "err-records" for the primary error-record window.
+      err-group is the error group status register window (ERRGSR).
+      fault-inject is the fault injection register window (ERXPFG*).
+      irq-config is the interrupt routing configuration window.
+    minItems: 1
+    maxItems: 4
+    items:
+      enum:
+        - err-records
+        - err-group
+        - fault-inject
+        - irq-config
+
+  interrupts:
+    minItems: 1
+    items:
+      - description:
+          Fault Handling Interrupt (FHI), fired when a corrected error
+          counter overflows or a deferred error is detected.
+      - description:
+          Error Recovery Interrupt (ERI), fired when an uncorrected
+          recoverable error is detected.
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: fhi
+      - const: eri
+
+  arm,group-format:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Layout of the memory-mapped error-record group window.
+      Determines the number of ERRGSR registers available.
+      A 4 KiB group provides 1 ERRGSR, a 16 KiB group provides
+      4 ERRGSRs, and a 64 KiB group provides 14 ERRGSRs.
+      Each ERRGSR reports status for up to 56 error records.
+    enum: [0, 1, 2]
+
+  arm,num-records:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Total number of error records in this error source, including both
+      implemented and unimplemented slots.
+    minimum: 1
+
+  arm,record-impl:
+    $ref: /schemas/types.yaml#/definitions/uint64-array
+    description:
+      Bitmap of implemented error records.  Bit N set to 1 means error
+      record N is present and active in this error source.  Bit N set to 0
+      means record N is not implemented and must be skipped.  The array
+      length must equal the number of ERRGSRs implied by arm,group-format
+      (1 element for 4K, 4 for 16K, 14 for 64K).  For system-register
+      nodes (no reg property) a single u64 element is used.
+    minItems: 1
+    maxItems: 14
+
+  arm,status-reporting:
+    $ref: /schemas/types.yaml#/definitions/uint64-array
+    description:
+      Bitmap indicating which implemented error records require direct
+      polling of ERX_STATUS by software. Bit N set to 1 means error
+      record N is not represented in an ERRGSR status register and must
+      be checked by reading ERX_STATUS directly. Bit N set to 0 means
+      error record N is represented in an ERRGSR status register and can
+      be discovered through the ERRGSR scan path.
+      For system-register error sources (no reg property), ERRGSR
+      registers are not present. Therefore all implemented error records
+      must be polled directly and arm,status-reporting shall be identical
+      to arm,record-impl.
+      The number of array elements shall match arm,record-impl.
+    minItems: 1
+    maxItems: 14
+
+  arm,addressing-mode:
+    $ref: /schemas/types.yaml#/definitions/uint64-array
+    description:
+      Bitmap indicating the address type reported in ERR_ADDR for each
+      implemented error record.  Bit N set to 1 means error record N
+      reports a Logical Address (LA); bit N set to 0 means it reports a
+      System Physical Address (SPA).  When absent all records are assumed
+      to report SPA.  The number of array elements shall match
+      arm,record-impl.
+    minItems: 1
+    maxItems: 14
+
+  # Processor error source properties (arm,ras-processor only)
+  arm,cache-ref:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    description:
+      List of phandles to the cache nodes (L1, L2, or L3) that this
+      processor error source monitors.  A single error source may cover
+      multiple cache instances (e.g. one per-core L2 error record group
+      that monitors all L2 caches in the SoC).  Each entry is a bare
+      phandle with no additional cells.
+    items:
+      maxItems: 1
+
+  # SMMU error source properties (arm,ras-smmu only)
+  arm,smmu-ref:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the SMMU node that this error source monitors.
+
+  # GIC error source properties (arm,ras-gic only)
+  arm,gic-ref:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the GIC node that this error source monitors.
+
+required:
+  - compatible
+  - arm,num-records
+  - arm,record-impl
+  - arm,status-reporting
+
+dependentRequired:
+  reg: ['arm,group-format']
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: arm,ras-processor
+    then:
+      required:
+        - arm,cache-ref
+    else:
+      properties:
+        arm,cache-ref: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: arm,ras-smmu
+    then:
+      required:
+        - arm,smmu-ref
+    else:
+      properties:
+        arm,smmu-ref: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: arm,ras-gic
+    then:
+      required:
+        - arm,gic-ref
+    else:
+      properties:
+        arm,gic-ref: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/arm/arm,ras.h>
+
+    cache-error-l2 {
+        compatible = "arm,ras-processor";
+        arm,num-records = <1>;
+        arm,record-impl = /bits/ 64 <0x1>;
+        arm,status-reporting = /bits/ 64 <0x1>;
+        arm,cache-ref = <&l2_0>, <&l2_1>, <&l2_2>, <&l2_3>;
+        interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "fhi";
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/arm/arm,ras.h>
+
+    gic-error@17a00000 {
+        compatible = "arm,ras-gic";
+        reg = <0x0 0x17a00000 0x0 0x10000>;
+        reg-names = "err-records";
+        arm,group-format = <ARM_RAS_GROUP_4K>;
+        arm,num-records = <1>;
+        arm,record-impl = /bits/ 64 <0x1>;
+        arm,status-reporting = /bits/ 64 <0x0>;
+        arm,gic-ref = <&gic>;
+        interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "fhi";
+    };
diff --git a/include/dt-bindings/arm/arm,ras.h b/include/dt-bindings/arm/arm,ras.h
new file mode 100644
index 000000000000..cd11e360fdae
--- /dev/null
+++ b/include/dt-bindings/arm/arm,ras.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_ARM_RAS_H
+#define _DT_BINDINGS_ARM_RAS_H
+
+/* arm,group-format - error record group register window layout */
+#define ARM_RAS_GROUP_4K		0	/* 4 KiB,  1 ERRGSR  */
+#define ARM_RAS_GROUP_16K		1	/* 16 KiB, 4 ERRGSRs */
+#define ARM_RAS_GROUP_64K		2	/* 64 KiB, 14 ERRGSRs */
+
+#endif /* _DT_BINDINGS_ARM_RAS_H */

-- 
2.34.1

