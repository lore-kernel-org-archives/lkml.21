Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996315;
	b=l2E0Yta9NNm0oAEV8xLIMdyL9jLgGnvCCZMR7dCKD3JXfg4cAT6inLTRiF4GhcUj2uZ8
	 aYnNywTIeCpWCcrHmUs3BudqUIoAoMwAqIW3HIjxECQQxVx+NF8pXvx1mG22jaOzN9T8r
	 8otGsHleS+SZ52AAiIWD1nIwp81GzvmSMY1KAXtH2D2vWKGPaBqV4Z2bV4wDlkmvvPxTN
	 UsbDBwM7XujN5gglu/3J4hZwfKRYnpbXK22vWdPdd3si0nJNPld0lgec22d38cSZHLcgW
	 AiA0Ryi9scDGXV0jHpIQ0/krwkN5rRYHE9FBetAoUIqfytmW9lllChvG0PRCAIgCJ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996315;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dP4h85XmI1oLNRq4PDQGHhAv0vu8uXk4BOk79yd+920=;
	b=wIV5HPnHpsazrwiZjom0xGcZI6MeQTzbXglphPFUsSk2VWJKntzxfPeCMdAXVZzRdznW
	 /6JPCeP7WtxMvrkvI2I/Yk0FfVPtH9qE0ODCSu8p1VbMfCkO539XQER5RFR3zDCBXPuhG
	 QsOWgjB5qr4+qYUoR0fG3UgiD3IT7ona3W3TQIwtjCgg/WVk3nPyUsEX0Dl79o1x6qDDj
	 dF5BCQcBMAX6kvxDI9dxnrY83cz5hcKFTMBuKKH2Uucd4pzei80SOf92z65UzQYkFWcrG
	 +TZbN56hXqrt9RzVybwtWCi8tvHVzlNd2XLQzOtYH2Oetc530nK40ZF3xge6eDkKt4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c+lilmnQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="c/9yIMUb";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA6F606A8AC
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CA6F606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c+lilmnQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c/9yIMUb
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9k6283578158
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dP4h85XmI1oLNRq4PDQGHhAv0vu8uXk4BOk79yd+920=; b=c+lilmnQUlGKm6Ju
	ilTlBRRDIjYlfWlhp2mabYA9fwX7gF2VnNr13rhi1LQ8H0cQq9Xf/+dqjB8S9Zba
	0ar9YmYGvl+QZhOlgTqmvSVHw6wnOBmhUi9JAvaq+/vro2bEkBycsTjG4Q4U/T+3
	wdI/kl3HnlkmIgH/NYStQU68yN5Xfj2CvW8pVKgPWlB06/rn3S1YL/He8o6hSt2n
	tMulpzZyQsEZpE+phNsUD4lnSftBZbpFxRnEDiEeG9t1JBXdDNtLRLez/FzGwh9y
	pbzOAoC71yakzZctIkszwcG5jbPneoynvjl8nqw2hJWzwWfERL5V0kCCvwS+GmGm
	A1Odtw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv72hbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:05:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-921029ad756so13716416d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794996312; x=1795601112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dP4h85XmI1oLNRq4PDQGHhAv0vu8uXk4BOk79yd+920=;
        b=c/9yIMUbY1sWLzz2sq7r/RG+SaM+oDEzq6kYxDoeyfQFY6wo2Fh0z2RGr/6s0soWV1
         jCXrfISo87ByVefGbcndGtgmjqNEiPAUz9TjAfiPcWilA/mM6F+jn0Yqev87N7VN7MzZ
         lacumYNqSHfZ21mA5vKfd2Pg6UbYYiBVEYnR4m6NzyHdOBNIgJfFNXBfsKeZNeWPH4+9
         FE/fqNREq1/suWxCjVFITX6E8ubeopm3+vgaOIXC34zkVjVz1fGfwqmC5ew//8b84/zs
         CnN0vDXL5Ej12iO8b5FnFNolJEMdMsSD2zXNatze6Hez/go3AL0B81/4vvZ/l5ozkxGu
         unTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996312; x=1795601112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dP4h85XmI1oLNRq4PDQGHhAv0vu8uXk4BOk79yd+920=;
        b=E+3azf52ILfIVLcmE38pom+iH9RmzYeaioWGUL0KEvIS2AhyjrjLZHFAsyOXca51cI
         psPwxHfzk1cMrXCd0GK8GD3PXMoKrE63kRkWb7Qb9Y6kYNo2csGJAWe3vn+olfE0Su+O
         09me1/VVooB34lDlPmqfhzDYtWUlGYyk07/7OLYGNbg68yyrMh+R7lQmEo2EA3rxnHpz
         u4IWSE5NLqRUTaqVcxgmsO8StqvKssEPONpmh5FAsBPFHGjZjAXFkB43xYtquVRVG36+
         TuHRNFqbclKeY4BnG2nfQ0TF9qrijcfHs/Fd6UzJZABmwNtTUyMgPwdlYU1mITm6oBQi
         QR1w==
X-Forwarded-Encrypted: i=1; AL+hErGjPkYFTxHMQGzANGcFWMDMLQ0N347u7h1MF9bIbsle0moiVwJ3TlvjcCuWSc1ut07OPjAFm4Xk/aj+vFs=@vger.kernel.org
X-Gm-Message-State: APuU4Z88BrYVHC6qmalo9HqLlXImycW8O9iA/cyoZLQgEGV/iLlpfT6h
	HZn7lLRv+q+1jVJ3CPuZfLAmYmc4g/7jLsCPHNrHelwrLLgBgxJcpvkzhpqqX4+S20Et3bxICWJ
	Lr5oE0i92Twwv6wcUHquOYdiz5g9YfNydjxR+wOjzu0qMYzfgcxsxoHMf5cuctm+dBGc=
X-Gm-Gg: AYBFou0qpNtivQdNGTieymBhLC0GvboZeOVd2CO1ffjrq++FC444YyrGHrWp/Ju6/ud
	o9UTEL6E1APhw83Zo4lhE8/8jyfpAYtJviZ/K8x/lqiUUJl4FKWu3QpgjajhqNu8tyCNlaVIhOW
	nEmbGjcu9BzYaDjQeAUvNo0lTSLeJh5tRyg9sMmVCkmtPHxPZH6Gh5f/h3QilB2OD72fIXSWyQz
	EZ1AWqXqLv0uVm7B1SfK0B+irNvk7psr1qBcWZcki1aHoYWDzG5W5IpVBOY+fum1qLA4ZNziHP4
	Cei14AoNKIzuvqyBmnIF+o+aXmbvf7k7fB57PQnigjqiVgcW+AgAPwICT+249VwSEpwk2CkVyaq
	RrDjwkkB2NFsHIpxq8nGyulV2uAUzUCLuOD5AzjvNcWmAqtqvOdaRlYkWRJd7x4Q7UXKuRa7slZ
	k=
X-Received: by 2002:a05:620a:2b88:b0:949:61c5:73b8 with SMTP id af79cd13be357-9499972bd33mr365002885a.44.1794996312336;
        Wed, 18 Nov 2026 02:05:12 -0800 (PST)
X-Received: by 2002:a05:620a:2b88:b0:949:61c5:73b8 with SMTP id af79cd13be357-9499972bd33mr364999585a.44.1794996311869;
        Wed, 18 Nov 2026 02:05:11 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609389dsm3735509f8f.37.2026.11.18.02.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:05:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:05:03 +0100
Subject: [PATCH v3 2/2] arm64: dts: qcom: lemans-sa8255p: add ethernet
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
Message-Id: <20261118-sa8255p-emac-dts-v3-2-e2c365d95a0b@oss.qualcomm.com>
References: <20261118-sa8255p-emac-dts-v3-0-e2c365d95a0b@oss.qualcomm.com>
In-Reply-To: <20261118-sa8255p-emac-dts-v3-0-e2c365d95a0b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6727;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eD+JGrj/A1Wbvg7snYomXvbIuNT5d1KFlfmI3BIPkm0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq/XhQt/Xut0Hjz5TlihasvU4foTMGjHXd3xXFR
 tFoFj6MR7iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCav14UAAKCRAFnS7L/zaE
 w/pXEACrxNDH/kJlfodedNfAMRAYSPq+wl4VWBuwoR6KZ1YudJ1dg5WjjT29Ron3uL9fJtHeY46
 K4tAiyZxHZUDRxBHah12UqE2jlyUKeKeyenY5KATuJiUi6DBWJbGVLIj0tjTKJcMJM/IGnNjo70
 PjcZT1Drb1bmh+90bzibrhgFIahVduW2DQoRVNl8dZjwn1Y5SyV00UO9t9Xkc0bOiLTM8PRoTGV
 JdxCWVSp75WcpemdmC+1x+gC3DynwTMVr4PO5cksmnsiN2ioIOvN9pX7MClMjGYS7pjQsNWiH0I
 YBjivILUDP9aN7LKPs7jBjtBzDrIAshJDSeaRI4GxgNJGhBfRnob1vQkjqN6I7IhSCiZ/2y4Zbm
 W6BBDkSUYRLf340HpDDXD+c36REv/3Nvkg1UFkm0PUAwG3fCpBt3ieTh5ngMYcAr4tfz0U8JAHd
 16v35hRaMuI4jvVwyA+MDML3/ilUI15NrspE1/IsaKSVQWeqh9ovsKr+xpOBkmN2uMGuvSEOnQD
 mX8IE1Fht7TWZQyOHN7aXuJmbNDr1hgn3NWB0vGsd80XGG9pMkjtzoAlZP6bBF9mXoW74FkJoE+
 AO9kQ1j/AXTR6OglArvQn3cxR9dP9bp4xI79rmpvJkHDdnh6ocvLUJUwBnGxnwOsKqQoTK9+ucJ
 jE/SeOCPVfY5qcQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: sBUpIxpFG83cYl9O5RZjIy7LVJQQCJzx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOSBTYWx0ZWRfX8/UmCqrZUmix
 VMtj9bJSlb293GfRsfWqyI5XM4x+Pl1bLz/b9cAiNrHxTfVovJjztNS0skXXM1YQStXG1BOSmU0
 s+X6qHQlmh0p5M2zOa69iY0/6Z0ErNXXzoRhrUTxY0d3s+HAw2/lNHUx/42RhJhRHanGm/PLsbA
 xLeBuJJiY7nxs8wy6HRMhbn4+kAnqhmPkjtJ+U/ODGHsLvbk7ONldi6Z9Bp6geMqcQ/R4nO7rGM
 NyqQ13jQJEYUrdkHjrMb4Gji8Qj4pqonHyMMhyESk/squs+zpPTfQwk26U0o0cNAiMwooZlNf+A
 qQqLZVPYbhuMS3U9A7k4bftEzvWKgboKazFg/U5tna2lhawW9NlzwTPE6e5f9XN74UMyivyKmhU
 OCwgPGtqd1dQxY9etoyhulU84AgnOJ09F12zTntGndSs9g0KqYadVE9g3Fn06U6U0PynDRrqZ3K
 xGfJkIIQJFf128UZO1w==
X-Proofpoint-ORIG-GUID: sBUpIxpFG83cYl9O5RZjIy7LVJQQCJzx
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd7859 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=LwjCQcZIY1nU89AU52wA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOSBTYWx0ZWRfX45Ed9XOK5PI/
 6KCn8q3TAd2rxOCXd4g8iQmEZ79we2r2RRyeN0q9jJJ6hfcUskuk2l8JocGfxA5udYR1smJJEIn
 X7abnJvyHgVYnFKS/FsA8cUP52sibXE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180039

Add the ethernet nodes along with their serdes PHY nodes for the gearvm
variant of the lemans ride board. Enable scmi7 and scmi8 to serve the
EMACs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  34 ++++
 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 201 +++++++++++++++++++++++
 2 files changed, 235 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
index 91c97a55f2787406b104650956b9a511a6a34c23..aaa8d96dfa61984afaeb13d7543140dd1724979d 100644
--- a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
@@ -58,6 +58,22 @@ &cpufreq_hw {
 	clock-names = "xo", "alternate";
 };
 
+&ethernet0 {
+	compatible = "qcom,sa8255p-ethqos";
+	phys = <&serdes0>;
+	phy-names = "serdes";
+	power-domains = <&scmi7_pd 0>, <&scmi7_pd 1>;
+	power-domain-names = "core", "mdio";
+};
+
+&ethernet1 {
+	compatible = "qcom,sa8255p-ethqos";
+	phys = <&serdes1>;
+	phy-names = "serdes";
+	power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>;
+	power-domain-names = "core", "mdio";
+};
+
 &firmware {
 	scmi0: scmi-0 {
 		compatible = "qcom,scmi-smc";
@@ -2898,6 +2914,24 @@ &scm {
 	memory-region = <&tz_ffi_mem>;
 };
 
+&soc {
+	serdes0: phy@8901000 {
+		compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+		reg = <0x0 0x08901000 0x0 0xe10>;
+		#phy-cells = <0>;
+		power-domains = <&scmi7_dvfs 0>;
+		status = "disabled";
+	};
+
+	serdes1: phy@8902000 {
+		compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+		reg = <0x0 0x08902000 0x0 0xe10>;
+		#phy-cells = <0>;
+		power-domains = <&scmi8_dvfs 0>;
+		status = "disabled";
+	};
+};
+
 &spi0 {
 	compatible = "qcom,sa8255p-geni-spi";
 	power-domains = <&scmi10_pd 0>,
diff --git a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
index 6f19064997a4b50525fdf630307b843604368645..991626589cc34112df6e024d988bf87e6f520017 100644
--- a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
@@ -14,6 +14,8 @@ / {
 	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
 
 	aliases {
+		ethernet0 = &ethernet0;
+		ethernet1 = &ethernet1;
 		serial0 = &uart10;
 		serial1 = &uart4;
 	};
@@ -101,6 +103,173 @@ trip1 {
 	};
 };
 
+&ethernet0 {
+	phy-handle = <&hsgmii_phy0>;
+	phy-mode = "2500base-x";
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	snps,ps-speed = <2500>;
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hsgmii_phy0: phy@8 {
+			compatible = "ethernet-phy-id31c3.1c33";
+			reg = <0x8>;
+			device_type = "ethernet-phy";
+			resets = <&scmi7_rst 0>;
+			reset-names = "phy";
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+
+		hsgmii_phy1: phy@0 {
+			compatible = "ethernet-phy-id31c3.1c33";
+			reg = <0x0>;
+			device_type = "ethernet-phy";
+			resets = <&scmi8_rst 0>;
+			reset-names = "phy";
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&ethernet1 {
+	phy-mode = "2500base-x";
+	phy-handle = <&hsgmii_phy1>;
+
+	snps,mtl-rx-config = <&mtl_rx_setup1>;
+	snps,mtl-tx-config = <&mtl_tx_setup1>;
+	snps,ps-speed = <2500>;
+
+	status = "okay";
+
+	mtl_rx_setup1: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup1: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
 &gpll0_board_clk {
 	clock-frequency = <300000000>;
 };
@@ -145,6 +314,14 @@ &scmi6 {
 	status = "okay";
 };
 
+&scmi7 {
+	status = "okay";
+};
+
+&scmi8 {
+	status = "okay";
+};
+
 &scmi11 {
 	status = "okay";
 };
@@ -162,6 +339,22 @@ &sleep_clk {
 };
 
 &tlmm {
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio8";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio9";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
 	pcie0_ep_clkreq_default: pcie0-ep-clkreq-default-state {
 		pins = "gpio1";
 		function = "pcie0_clkreq";
@@ -205,6 +398,14 @@ pcie1_ep_wake_default: pcie1-ep-wake-default-state {
 	};
 };
 
+&serdes0 {
+	status = "okay";
+};
+
+&serdes1 {
+	status = "okay";
+};
+
 &uart4 {
 	status = "okay";
 };

-- 
2.47.3

