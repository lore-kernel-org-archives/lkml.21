Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182229;
	b=AZMaOSsBJZZZMCjzABJey96x51t33JVqiw3h76Bc7Iy3fXtA1QTRSlkp2thd637ABlmz
	 3cZjB8lBxR79X1lUu25qGOIxUyAESARTwoKu/3MogzaSKOa59nWPnuKr6+j+0vF81qA6R
	 3jZd8G5Vs9nq1g6CCXJyTRFDom7/E+8+26dc8znOs0cIDVkSJeMSC6Wl9zHye/pPDtaPl
	 3sBYfxlV+Yk5uVdpsvtDireCfFe6ltWZRP6oadMHP/mne9mmjHRPZls55x9keXG70xvmu
	 D2O4BaymUy6ldq3zLwTVIpYrZwGyowPsetcJl2urdIybFTKF/jyER1zOSdTXgKSnzgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182229;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
	b=4TCeckaJEFMHisohuEzrBQAc5qrbI3dKMRSF/L5soCV2cFzHFhI2kZxIFw3vBB+HTIYl
	 m++Wf4nP/xntuUZyqPi59iXi6whEm5Kt8lBQ1NV7FmllFOQJJy+atbIRCTtNKG6xLM2hx
	 Swbu+6cP2HNnZw/Un0JNhZoaUKe1UaqQHxlow/3Bja0DUXwEfRian8sipYbnXslNql7qc
	 xvhYeJa9EBdVmG/P8uVXGD1px1T5gaZhnUgSivF3ktjFabhI1MfhkpVMnm2QysUze2QL/
	 jBvb/F+w2rqWJK38SCubHpsZ1GJIBX8TDHo2gzeyGPvriuadw5TTQaKgV7QD8t36GmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YCsF+IDs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EY1f0pnI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988B860A2631
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 988B860A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YCsF+IDs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EY1f0pnI
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjwT71528606
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=; b=YCsF+IDstQv6MIvZ
	xsCj27b5QrM6GVtFKhA+KTZ8aWrMjUB1690xvobTHxxplPXUy1Z5FnIZLbs2kkGS
	62YheN/JbLYl6x1eu7setWiTXCBncPR4/J//f4/OOXMPTGzDrFNIeDTGKCtqlRe+
	UqOdIZA2zTmxIcbgjIRT9hn2DUZ2vEJUTaz1mT5kpOuB2uZTUaXMBT7oa/hP6fxz
	LUW/S7MiERWNIFQ4Y4dTKeJMGAMdoUMscUNh+T+Xzqi4soHVa6zqO3sPgM3rEQ8u
	joaJQsAPVS5506TQmnNHOEk0sWdrytK+n6cZX21/EOwkFJ0x4U0y14ZNZtpR/uC2
	S2TSPQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtt2ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38355b03cb8so856139eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182227; x=1795787027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
        b=EY1f0pnITXvk2YAREOAKqvYArQzrqWlvSN9baRenuKhXUZmERL7PLQ+L9GZXKVETk3
         hp7UmpSangq/AGTVKN+AI4+/MWJJy0qBcWNU82m16HvcZ4HWECWV4lZECn/iTOI+etVc
         Nc0aSlhK9jrJ0sYB8UCVu0gb2uhSSmSjBBgAWX0lBEnaVyPCUGrPO2hlj32wXK3xBQkS
         PO7WnUeLdPInkeiyJxelEvELt/Qq/lVzwGhoww5otlmdXAbG7zDTFFq7YcjBqogXaHnM
         bi5unf62nr2p3VciiQZP0skCK0SSJlOkaDDSv/VUckhWa3iKSN0HH7eWjKIQ873Cw2FS
         P7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182227; x=1795787027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
        b=iY8k2XQAw2HuzYklWbOuMkUy9q4jgTzzHW4w1dm6msbKOg/LYPvNcDREZ4bqUGJOs4
         qtxHYIBPtX28UaQ2hLS8n1pcrt6ZSuLe65cA+3sjE1fVFnL8hIsf/H4nRHvB0MylQqQ0
         mTSOgYg/XP90s0INyKnBMuI74a4k44n8Qc17qioJJnSftbp+lCkmjfJimYiw7UiHN4N0
         FdtjkwZ+ajLdA8ktkY0enBIAVgGRPBPrAbfJSBJjpd5ufnnxz6nKyhGqYmNlGRwDHUsM
         +KZ99/Cd3oJpLnSxh9eQQrqeoHf1pwZlPw4DSiJoDSZV16Y4OBRjgkp5zxtQFoE87QbE
         1EwA==
X-Forwarded-Encrypted: i=1; AL+hErEp0tP+14EjAB1YVZhSzoe0fRAWE39kn7nGqcf4KkEGW04bACE4z/aDaeberRJEb7BsytEuEpvzGRr9mi0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EM8z2WjLMq+BnNqJwrvo4nUpGQEYXV2K/vpDV5AgtPqIDoFKM
	BwzhB8pK3nwxnEZLF5X2na5Z7SbYx/eyaifbdxK+eRCGu+UDBkuwZcHYUvrmmwAZgp6aV0OpQjW
	A1J2ZWfb+wPyQKoDhEq63Xp2Xj6YykOBomRg9iVN4hWAuBNS0qbY5/u0Qw/OYzLRSfKBgnKADa9
	A=
X-Gm-Gg: AZFdTZep8h9NHHxnn2Do/NCG4t+IZbwTeDJSad//eDwSVaGINlqn/D8zpfovpLLfFJQ
	QmNCyOM7Vq0MXLDV4sDsyBwfIJEXBJBpXHYOo8B+YJOzPDKzvTKVSVfVTnde7eAOPMHps757G1/
	dhbRIKdXdBE5ef16idn2xTjlXoQddVS1Sis/z6Q+9YpmaI87uSYesWQwY2X/ywcVBalTq2+8Z47
	YaP1DXrMpziTQ9BT9DryMCbpWP1jK4KQNJSnlpMEEqOuBOtMK3FwfpK7nRDBRDf55OPYOCM33De
	nsKvvX18DXVQEJBO706FbfoZJnuzrIwm4PL36pApwPj+ozI6nwRWAhGBngs8UjA7CqOIi8T6258
	N648qqUgZluVWGFzhxoXLjlhc82n2b46gCvgoS6yOBN1v66cAB2Y2Z4JBa/RcgiJnoLtHCoDG9O
	3PvYQ=
X-Received: by 2002:a05:693c:8951:20b0:384:ce59:5e19 with SMTP id 5a478bee46e88-3856f257bd6mr2694903eec.6.1795182226330;
        Fri, 20 Nov 2026 05:43:46 -0800 (PST)
X-Received: by 2002:a05:693c:8951:20b0:384:ce59:5e19 with SMTP id 5a478bee46e88-3856f257bd6mr2694873eec.6.1795182225726;
        Fri, 20 Nov 2026 05:43:45 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:45 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:46 +0530
Subject: [PATCH RESEND v4 15/20] arm64: dts: qcom: hamoa: Add GEM_NOC
 interconnect for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-15-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1049;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=o8a7Ojp0eNjNzQ0rCM2WmCZSQ5u7xFkQL6aYtQmrXTk=;
 b=shWpSkfNSnmk/Jcw28HmhRNuejqHcOqrgMbIwuKPiGgefABQtWtryhrv+xF/ZuYuxLXp4XrdJ
 0EjfJJi5GtKD+6oXZONpBDOmHdTkkm4Cw/3B7UEMYg15dD4bavucvgu
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: WfgpnHc02YG8r60EioVZJeDIf3HWQ0B5
X-Proofpoint-GUID: WfgpnHc02YG8r60EioVZJeDIf3HWQ0B5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX5GiJBuyFvXBD
 R+oIeYF+mbzqCg5sqaBKx1yTwkafHDxxic9gobxrxvdaAnt+I61wNMlmtcwjc7n7IavaMt6G2j+
 0Zpq28tZjK+DSvm4rSpQKhC/zHMnJBCbCQEvEPVVq4tDeTo/p2bP1n4pagDb+igdbYwdQ0FkJVi
 QEZP69oR9w86xbIeKyaX9jEi0RpxGPg5ojhnA5BP3cciz6iv+nxsRyD7Yo3YTiSXhnEJEVEtDrq
 x17XcJeDeji3ErtpihYshSG/kt7688TE/rhigDJyn2QEPEeNwStyQkYuNDyBfnxLRQ+VXInhx5e
 5twThkejv6B+g/AcTUGAW3EddVv4VJX7Pup4JWTe3pccoah/EuIwbPFEf3DD/wXysDICxI2/um9
 vTCSWG7lYjBYDgft31Pk3XYyYllt1uW5aglzHq8jhIHl2MRL2syL/hNcFYffRjVGO6pIDODjW9K
 SSmhr5ZqY00zWKl9RsQ==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b004e93 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=WAcSZy-hVgrt5OVmuNwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX7oTv04kTngMF
 nMfWPScOPKKkT7JtywTZOapaINcqrtSaa4oTnRssLr72rcOKXt7rewjIZQEXg/21/w6joBvyXt5
 Ni4n5XiVACkdpmxy4eEN5cmJ3Y7cgtI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On X1E80100 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 443c1a5c212d..f5b720d73a4e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -4289,6 +4289,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		gem_noc: interconnect@26400000 {

-- 
2.34.1

