Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943167;
	b=eOvKFsbxy1dROJGtuFEQcIDj3E+DOG+JoFcM5W2P1Cs8qPPaEX9NRkc19jvKUb7ls82/
	 o6ZMN8BgdPJ5NRZHamaiWfPJ7tchv71o3FSCyVBAgjiPaUPZNRYeoHrV7YcwlEluIWsAe
	 eOppjHnhu4apDJreVfMpJblnvjBf8tMXLZzL2AUliMK1USlKiwhO2pQqs1nQwKDPZM19A
	 sQGimSEIxxqHTPhc3nPcmDlyGVHBfJvrxdbPyk+c2mx8gpz14CdJqzWP1rl7P27feSxYT
	 CcMbAQepZtEIVbqCryeIENyQU6Xg5d15uKlOcRXET441xZ2Y+Q0T5fGnc00HYal1NQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943167;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=60Kl5Jhv1mOsJK3qcOKqjwIXh+EBJS44Vine9B7VtJQ=;
	b=w4SM/PATc3PJxV+CH4xcxk3/rvMaJXClKKdHLr9mU8zoARDxC1UTDTgZUhAQl9hT3feS
	 xU+XJzdrNYT61K2QsAE5NXtDfPk59Khf2nn4qf+p8N6kVAglEmVnY2ERPkFkn44XHp6rr
	 zfh/I19AyNtrDbgCPhSegOIseZ95l1TupAGvfvLPxkRMZ45iClqfotqvcSchKC3Dp41eG
	 Rc5qERO4i935RLLnzIH1di09kbppVlhb+n5UWxBrvjaWPO9jrjVf8Nwj7U4fbxKgXLQr4
	 yULiWs9xEz8+Z+Op0P47o+MxhekVXY2CIMBCv/ZuqZ+Tbr1AVMW5iROhdaZWWESbQJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bySchDoK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d0bCDLlP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0874A606A899
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0874A606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bySchDoK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d0bCDLlP
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ6Zab3093083
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	60Kl5Jhv1mOsJK3qcOKqjwIXh+EBJS44Vine9B7VtJQ=; b=bySchDoKDpg5Lyxf
	LPhloKc4BcpgB9pLUWGjAuXw79fUW0N9QerIdmZa2zgUPU6hOlNyUtOWD9pX294u
	SWlI23EpZD5+X0oZM3Zm2C7ILJApd0GUOH2dVm9Fv6XBPgvNpcUqrGP7Y07A4ahf
	KApR5X8Tb0hMKNWby5sul0fQpuVNj97hrCEBbN7dWF/Hw+kdt9yo7ZGclNQC64j9
	L82FzEOeNwDkVE/9Ir/J0WGcZnoqkRvWkOWNZ1tL8doSs19JwqmtBEvrw78KGvqB
	YMjUH9PKmKO71JHA0Er3vPHS1T3NMzPUlNJsfA27Zz1AMIYB3TbI7AnK7EGcl6kT
	1YhWnA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0tjm0sqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:19:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f2a3f40c3so16329eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794943165; x=1795547965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60Kl5Jhv1mOsJK3qcOKqjwIXh+EBJS44Vine9B7VtJQ=;
        b=d0bCDLlPzEcPE+hzf+jM+ErIMdSfQ8LHN9hziWZfGze8HsmaSyfbPloaIIb1XbpmZu
         XxXwMf+cV7QbI7fTRgicLpKIsb0I7QzqBGHhTLU2a2O8I62MCnt1oM2QjuvT4+uCj8yS
         1jXJbxA8JxScfg8C3qniiLCNvjzLRd9W4u6MeIW+R5iRHBiOFXwuPcOpjVwQEnfe7cdC
         bXo66F0Ji8+ZMItaTo6Y3UrrGjfDnpIyjoCtFWc86dBHXF0TlM3aZm7TD9JpwUbDQZzy
         BWfXY4Fyhy/0FmyAB3pDjh8D/sUeWY2q4yLydGNqew4TaKeBzhNh/ckNgNUfkFRu2k1b
         sy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943165; x=1795547965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60Kl5Jhv1mOsJK3qcOKqjwIXh+EBJS44Vine9B7VtJQ=;
        b=tsAFm90aBiGzZnC3nxbtvDICBDVj328r59OHYYu0ksxb80sFonnd27/KqaXdGq9OE0
         8whoa7apyRd7mnqtTQ2s6VouJZQyXKkF/kuBbT7+HiY1/4W2PsqFg3+aULnDV0jC/K/+
         AESB84gTDxgnA93ZojNaMX8tUskPEZbKunOemDmICbsE2FqdbVmIyp5DhaKgrdufp9MB
         2I2YRbpyJWHJnOGsmAbn6bTXJisAShXbi0Zxm5OlQv671UFX+UMZ0S5stgkDDo+RSjZR
         Udx3g6k8T3e5w3wJTnJTNlkGgHRIHEZEzgF0+rclqkwPnMIiVjmB9hSs/LrvZzTdg5HP
         KjPw==
X-Forwarded-Encrypted: i=1; AL+hErH5bSYzLRSnlUbODBdDEJ+7IZYPvIdEquGC+EPnC/ObOyQpmHIkGgEzIeKypOt74Az4n19k8d/pq4pMLHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QPT6CoNcpE6mKoyWVahOBKSkYRUbbIgJQFm69z+s/Zfz5ld0D
	uqa13YQTq3U12d/4KQpLVbs4AWflR7P+q73JR7yYxiAHVYtfM1HPrhZzR5vFoMQCaDAm7ntB0nC
	zZT+dngHSynuUW1kBoIO3yqQxa65dENcbeVq1+uuqYVzNwU1u3YeHJA3mO73qylWpzJg=
X-Gm-Gg: AZFdTZfF0XaHZIdxtqNjpCJabYTX2RI2V/pJnP2hu8MDnOuUOQksJWEofo4rMPhrGik
	jPlTPM/MJKxuVsjeZsnw630bE3lLACOh+SzkRD0tri1CqeoHBLnLdz04LiMVHYrWkvPqvE7y56b
	TO/0bgyAhm65iXRb0xLrO/W6O3opwyMpozoNt6Z3gtv4+2clc4xpY2esEPnRi9mh/wB6KaMUwmG
	dlaDs+fvQR0dlKFJIXfZOkD3HBUA+3vw2Ous+Uf7q3UxcuRnNOuvRB6wd/f6Yw1drqPbx7KHvYs
	4IFqF6ysXRin96lcZQQcwnk+OT1FKr/Mq0U+w3Jh1ZWCLR04CX2pt89LRBaTCDQGD+ntWOnhsD0
	Gcf6JHS47j17uORq/zIFkqGAmfyVzC8m642S000OH/h8MdT1ry25OacaeT2SkcQcOBC/nSvCN3r
	ytYS2W
X-Received: by 2002:a05:693c:2a13:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-38280a3c36fmr442116eec.2.1794943164643;
        Tue, 17 Nov 2026 11:19:24 -0800 (PST)
X-Received: by 2002:a05:693c:2a13:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-38280a3c36fmr442083eec.2.1794943163858;
        Tue, 17 Nov 2026 11:19:23 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059f8sm32197eec.9.2026.11.17.11.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:19:23 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 00:48:24 +0530
Subject: [PATCH v4 5/5] arm64: dts: qcom: shikra: add RAS error source
 nodes
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
Message-Id: <20261118-aest-devicetree-support-v4-5-936587251e8f@oss.qualcomm.com>
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
        Avaneesh Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794943110; l=1782;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=l4p+6RAlvNC5E20oYKN0nb7ff4u82f7dc2bTNZ2GTI4=;
 b=li63lc5/FvzsDhC0OVMhM2fAI1esfNRVndV37bAWoQ3HYHw9IMhiKeoAnPaF6wan56EyMZLvu
 4CD0N0soY2LCdmRX3A8h88fCBd4w+B9c0Tf1PKOMn3wPYEePiWS+WtX
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfX/08bh3+4F5CR
 VoVXNlLcLyAJ/SNydLo8epPDFLpLk9g6KGk2oGpaQFI55HhnsBhMAQIIwas/14GrQiOXvKimjp1
 0Bd1xpi8q7T20GJcSglc9mGds15lSot09hqrUm+qMX+UjVJbckMkCzH2NG6kco+k+newvSttgMD
 FQoNW043+RPBlL6AindUoAliWkJRB6ZmDmtoQS7KPT2dV53f0+I6woCVUNuWCg07vGzcCa6BbMo
 /nZbKwVHhDRMXcowAi+qolBTdfQNMcJq5AdK8F3ufc0tUSkLdstqZicMRt876thC+RwbSzU7Rcc
 DTDXBgc/POCahdPZAl0XJXmjM+Refz0+aIEpteoDaffvnGT9FsjnAGYOwJTRQKq/utuKHmxrbK8
 2oHWvxje5Y0wVnTUwTz5jfm3hYOhmdzTIDpITFLaAwlzeiZywsZqQ2wZQEpKZExumvtsSCPmA0a
 YollEmsqZXdPIWMCh+g==
X-Proofpoint-ORIG-GUID: lAoTt16C6heh8KvXGOsjUDbRNkgV2K_s
X-Proofpoint-GUID: lAoTt16C6heh8KvXGOsjUDbRNkgV2K_s
X-Authority-Analysis: v=2.4 cv=Br8IUoX5 c=1 sm=1 tr=0 ts=6afca8bd cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=a7izLWPGlrKpK18tDBAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfX0cO9RbLC+8TA
 M8i0IXyLzDyRHCaqLxb7hmBIybpCXwe45kh8+n3F3URRlRVbdzatVWKb0CsJz524Ehx8IeWWtnM
 q/JG74JsywhnyUKWk1UWTgMQUTtQykU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170076

ARM Reliability, Availability and Serviceability (RAS) enables
processor components (for eg cache, tlb etc) to record and signal
hardware faults through architected error records and fault handling
interrupts. This allows software to detect, report and, where possible,
recover from hardware errors.

The Shikra CPU subsystem implements RAS error records for the L1/L2
cache hierarchy and the shared L3 caches. Describe these error sources
in Device Tree so that the ARM RAS framework can discover them and
handle cache-related error reports.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f..5c4a3ce34717 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -332,6 +332,26 @@ opp-2208000000 {
 		};
 	};
 
+	l2-cache-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <1>;
+		arm,record-impl = /bits/ 64 <0x1>;
+		arm,status-reporting = /bits/ 64 <0x1>;
+		arm,cache-ref = <&l2_3>;
+		interrupts = <GIC_PPI 6 IRQ_TYPE_LEVEL_LOW 0>;
+		interrupt-names = "fhi";
+	};
+
+	l3-cache-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		arm,cache-ref = <&l3>;
+		interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "fhi";
+	};
+
 	modem-etm0 {
 		compatible = "arm,coresight-dummy-source";
 

-- 
2.34.1

