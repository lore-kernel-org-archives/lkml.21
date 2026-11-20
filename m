Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172853;
	b=RGl9POYRHSrzr1TDr2qm90kwbM4mTio438aTaIGl8CfFMqVbJt16GQ2asueZwFejzZIu
	 jOu9fJUe4yIOGOpEMm9aa789KCl+1KeZTFUMlK5HPDNRnD8wX+z3/Qd+yx8pa9oEkwWYe
	 PpDxeKSCt2VfW674ShKcstVTWGo0lGxxhrA6+J53VSs5awNjNroCk1lDBXBdPAE8frHC5
	 0/QWcN44ec2pLZcL1ENsqattjMuP08jumGFluOnnDGrNC8YnbkLVN3Fl9aLIIHuT/+sRB
	 kfzmEfFQMnrHoH7EB8Dtt3Qc0MUrNjG/fFNpx8TF8o2e2lbpjNwnIIMJlQF2jLn+ZjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172853;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
	b=WpLBN7dEiPvtXmnrj2BPGD5HGpvuut6lkAZ/nKcCONgnvTKBF2S+4GI+QwsYUNaez4kw
	 FOQLbAKOS27FxVWhiOGJL1jFOGW69qsB+VK2voA10SEeiHkMxw8RlHRYItj2BvXcqAjSZ
	 lTafoOVnPp7ST6cJKHt6wkEZxZA9UIsUaJCjumpeiDlpypm0saVi6BQX20dzYr4BddBWJ
	 ti8g1LkITVZVE/+u+hR3hG6M0lNUT6oKqwqe6y67uyAfzPU9HWYfOv0bzyAyqDaD5/j2G
	 MzUuVPAtiH+yKiZ9bCspHsjeApDbmPjuYV8xC0YM9ZsYcYxmZVNP7KNO6TPeeLJgJpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="VnN7/0Pz";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C6odQ5LW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3734360A6F73
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3734360A6F73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VnN7/0Pz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C6odQ5LW
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjtom1681957
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=; b=VnN7/0PzTmZ2Un/0
	zIrk2N5Orv66HzLZe/Es24rOM2ssM4YtTEl8Mn+GL7AgPdhGZ6dgHOioe9vZZFNs
	DiAV59MKWHylvv96yU1SPzSML8oTJ/v+8yldAv4WAHsTGysNjIW3K47gfW1Rd+HR
	wcA+IuMyvxHIr0Jb1+5Kb4quagR6QA3l3kjB8TYAV96zHyaTrZwvq4qvDnPSkQ8X
	2QI2Sc9wsqfN8EiuCzCxTHpDgvkqpfYwjQPZNei5PvwtJpIGpmD25Ovkjob+hqRi
	Dc46oHG9t7DnTYRVhu8cix2ih/OWgskDTtlFeBnvVnaqVz1i3JsPBTDNTNV98adA
	Ue7gNA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1t3wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:07:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383435e46f9so604781eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172852; x=1795777652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
        b=C6odQ5LW1JyPJc9NfLgMpjOnPc9WNlAo7vbQUcaguqJIU5+Hb3ESCNfnBjku9Yuz1u
         6rPMi/9BsR0/Z1xygebDIOBdXi8tolFhKTfg8IGpU2wxNV/FsbiYu2cXs1USH9pW4pEx
         sOG4c+4OKfUeKd9piQmWayNH3XXiD/r67FvKOvVReAJDSRK8yPTZb7Kk3iu5gbCOB9e7
         +Ede9OhCL64v8VehNSxw0z1o0UyOEpCFcyKC1Ux2RtzNsHSxbfi3T2DbWnkdZ4MJAdNN
         YODXgTm2RxDc/KeQoEpeN3PO2UpqhmTOtqSRnZlpltEizYGAZxEJ7LtoyBT9s553enZ1
         ujug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172852; x=1795777652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
        b=b/qvVImNSm/+ipy1QS9jp2Weq335y3KY4bj10i70LQ1BhiFFLEVAkp9imwxfjw6CpJ
         8Bfc20is8tZGd9hVj+PbTlPgPYIqWVglNtRRFnu5PW4uuGC0CztDFip/FjO0QvtYkJ/z
         HCUzzI96jj6ojyZfcn/ouTuEi0IBIoiSXL2ia5CmUZlukcLN7mJmAZYr5lhu5QMX91Fp
         MTLR7hzPBdCxJdJKq1Emt+2mrpWYX2Q5ldXXr7lA44vpSjRyKdMwLPD/bAH11JYcRW/n
         NpGB21NVg8k2LuZy1JwbDF/2s5Ho8DcfP3B8ug0ppkLEiJphw3qSi33qamzSyxAOmDnz
         6+Bg==
X-Forwarded-Encrypted: i=1; AL+hErEBN5valtvibc9YdDRxOTdTld3vqf+PejuznA3hW7CVKlG9T2iAH70OoR3RWlFwBPQwTyQE/Oyx6g9JB5Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z93kkt588v49ecKkF68eKDNzcnHag4pKz5js3VHz+kY++vp68ll
	UYUs1KapOquJZKcsJtToQOfG7YdRMlnnKrtBnVg0ZK6ixPtw0hNlhJPd0Xo9INNDqHc9TNr5dxs
	42u9AfnNfT7SycxHSipc2BbWe+sV7D6l7YUMHcK8q4xl3OsJBEw2aAvjGmOLsY70hRew=
X-Gm-Gg: AZFdTZdRk3ys42DdmtWAo89p6O/3lUHmGmtkOzbL06yeyXpec0EM9mSLP8CWv6mrrxS
	kJg+UOe0irUypDbwCNkwZ1Uv+Uk796XZhhJ/gi+lBuifGJZlCcDU+jsJ0RNCpjtr4/FeogoZk+v
	00XovJ/VdRVpyywFQ5qb+rPmFNQUet+K5ww62H1e90Tl6wp+hxjfUj6/0Cj+v1pJgT4IOjMwOSi
	qN/HwFQB71aOOldJlsvnkmGgJQkDl6lNMT5wY5d/NF674C9QozwUAUUkHHYIQHTuqf70EpJQH7h
	FnrAfs58enU418FZXcTsIZ2CUg1+EwsQXFjApCZqNCzxW5l8iUOpDsX2gRccYM+TyrTGfYFklQ1
	cVzVSgZyNspjy5OpE1luvFQ6yOc4uJgGT0tNnYWRZPNO66kz9GLVCxmMnvzf0NcBbLI3TFISJE0
	jRZqWB
X-Received: by 2002:a05:7300:6d03:b0:381:9b9c:6140 with SMTP id 5a478bee46e88-3856fd5bf5emr3103032eec.23.1795172851680;
        Fri, 20 Nov 2026 03:07:31 -0800 (PST)
X-Received: by 2002:a05:7300:6d03:b0:381:9b9c:6140 with SMTP id 5a478bee46e88-3856fd5bf5emr3102974eec.23.1795172850989;
        Fri, 20 Nov 2026 03:07:30 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:30 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:49 +0530
Subject: [PATCH v4 08/20] arm64: dts: qcom: sm8250: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-8-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1033;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=W3R0vadqLaDaPerwJqu9PSx+OZnsGkbm84YuXP3uSZ0=;
 b=2QSTYCJTswayLaRtH+B8G1NNWBpnaZuzUwYJDYa5ujCqH09DMFxaY3GcRjghHbNwCvQg3CFqR
 pHhnKyLIK8zC8y+M50UC9afzeFvT+6TpYpA4Z5kJbURrxQvEsqL1Ibu
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b0029f4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=IeQ55TmpMpvzCWFLjAoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: CUFUhDGsQei3lPe53jyFlnNuQIqSSOlK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX6yTbqRE0e+IW
 BiaUieSwav9g2AgrBABWsRh0vsnPTaegmPpC+gsBTzDTHLOeKWoMIuTAi3hK3KPZotqQ+5McIVv
 x7rPcAPXQgU6us+diPzDCaRcXg6SMwPjQ6Oenx+lV70yl5loaEDC/UdSzyROWySUAjCPzxODSn1
 7D+OjZxcI/gwhUd4iebifrR1xIZaKGUzmTd0YCyFry0H/y5b6skIAz+9770BzuPmUT0jJzOefyB
 059JbhrLtwCHyGQutodQD7r/XAc3WgL3z2traI4cgpRFTtB+4h0xXLRGpv/RN9VU++0ruc8zxxc
 7cLSLmSXHU/fZFGzfsgD5kpKwi5antunEhA/mqHNdt5Pm999h73H4wrdvaszSSF2o7thb4GPeO+
 psV7LahD+Q+WuqdqpWs3zeczMo2/4bKbsxJaivzzjBfDtQPPa6cVuQ3eQo2dRTvSNchKHFk6Go/
 7/FhOV/0ecQ/P+xu8Ng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX7ZVhA6odx9EU
 Ai0Eu1CdAU1NhdLqJWaNu25l6UV7B/Zi5a2uQL0dsvPREvXaQg08E+bkpuzAZl3LWg4HbO2stOc
 2JpOKHLj9pT4VlSgFjWPs4doPA5FdK8=
X-Proofpoint-ORIG-GUID: CUFUhDGsQei3lPe53jyFlnNuQIqSSOlK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On SM8250 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 992284e64d38..3a368ef7c22a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3089,6 +3089,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		slpi: remoteproc@5c00000 {

-- 
2.34.1

