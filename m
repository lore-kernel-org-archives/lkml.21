Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749040;
	b=1wSOBJ3zvCallysOs5BR9pTbc52hgBNPH4gExnN+SrdY6BKo1urkjvipOp/qSeqZ9OgZ
	 IrfAByHJD3sScRVNZ/VjNzA+meaKCLOiH3xmDy9swEKWIdNQuFUZmXrPY0of4gfgiLoX5
	 vkDly2mka0SY+y+ZJdCd6LpRPVyYTn31t9HGensKesxhf2cSU3lb9POXssgkb45AFkbpB
	 v3nPKg7fvIehhq8vzxlhGPrmfs+/z8J2WLbNQRnuENqRz/pPwq6pmJl9LsmG2swnWL5pw
	 JijVEsG3Dy3nxSmrsP+LhGxI91whCWujLQJGn67nj3uiWqWPfaHMAkpU+DWy8vtT1+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749040;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9TY5qpw6Cyiwu1zQZiUs1s2rwROyuOGsmNwQ21EqSvA=;
	b=DTo64mPFhHYho+ajAK8Vkmfq7BXQhH/ARt7p/U7eQrwhYx60vHqJrvd7AyJ9LKh0MxMs
	 2foyzoEzYfLFzzTWMwICPUDDlWJWVwDx2odogkoLoXbejrX3soltCZpxA7AI1PFa6jkB7
	 szPYe4Zsk8yNKI3RUpzqLJtIao5HUYmUTn2Fp6eWq35ZhOlYaW4VlrUB3rDW4GvIqwA76
	 2f6Gc1z9ztVtGbr0Y7Lti+OjwXlXGs0g1W2Bzr5uwcbgN5Jy1KFRQobFAXNQ8ykLGWAx3
	 4pptG3E1l+hNYHBuGwG4Q8x65+Z1bgevSpZ4abkfnuDnJN5P21sQT9ROoP3DYol/17g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OyemlNmY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V5nV7Op3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B48606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12B48606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OyemlNmY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V5nV7Op3
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJwIcR3864509
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9TY5qpw6Cyiwu1zQZiUs1s2rwROyuOGsmNwQ21EqSvA=; b=OyemlNmYS1xXa63r
	DQVLTu+iUnsxfPVq9lH+OWZVOxsYJ5CqAvlQuPv5V7fQOnQ5bWcaWcQcIMEtoP6U
	ceGCRSWUePpw14g+Wi5CyAEsvirH5OWYo9qXIOP+bXoarY7Ujq+CPnwXON+ZR4ag
	jsbMO0YP+Qejam/o6NN4kehNL8Wauxtv4A9x/RmTZ9YcjxPFmZZYfLy9mcVaEi9/
	aCaovGHBwd9YDYsEGCzzvXHz6fVEmITqFSfxlf8TFDDfOkj+GT6iAMrOxngIe8wt
	caMNJye8KKutksvjeis7ciZaGotgPr7gFWEZo2H9Lrw9gT9HMwoAAGSzeaimbFGa
	Q1WpYQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55rxfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:10:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a06750c74fso5434063b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795749038; x=1796353838; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TY5qpw6Cyiwu1zQZiUs1s2rwROyuOGsmNwQ21EqSvA=;
        b=V5nV7Op3GyunTwiBHKHWp2Hn/AhuKjx4+vZbXtr0FB9PlqsvNQlF617OjH1GAuidaj
         e5GHnc2s3VFpTUUXRW1vBuUOlVgqHxft/uOmQ4I4gVAjakwSITRS08GLnOqYXwSS0+yk
         TDGNYBrps82ufFztRorY1iOqxsgE8BBuxx+vBl29ew+3dsSQ2fSKJG2mwMYPzZTzsFt4
         239k8fFF6ifk9nId8+/mimzmfDAmRB3MklNSHKv0Os+YwRDYFpz+H/++OmEjrGLhcPvC
         aCaLYbrJbtxpPuBgcWJu4WR5CVwNWUS1ftpHOp7aghFsblC6/oSRf60wMa80KoH7vRtU
         csbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749038; x=1796353838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9TY5qpw6Cyiwu1zQZiUs1s2rwROyuOGsmNwQ21EqSvA=;
        b=GfRvw6u81BAggqaFpz8RNkpnxLQoquLr3wtpE25zOY85cwcjvhcZXaow1V1npCcJw7
         eAGt6lAVnEjrljEti/VhwcouYY3Zep2O2K52O/DXYHw8tK6+XfZa3PwJFka4nmFqHxEt
         KcUqJdS4DWNYkyhefjLl5T8sqOBFTNEN/NbX0sU9wXyfa2+PB96Bdxqosh3B5jNAY0d7
         26uWxkILZazZPoD7vmXwWMY0vaQR3N/d4wYfsqWczL18aZjozz3CXBS3UuM5GCLvl1mf
         CaycJof/olMG1Fd8716WLVt1q3NAPwugBAezEXZOSnCXatVT9Dufi7dlih5UOBUytrsX
         0JPw==
X-Forwarded-Encrypted: i=1; AL+hErFIlZEcZ8kn+GeOqPON1o0vuxrtQ5FXJ2+ie2T5GC7VoawBNtFWn10j8aUbyhUUfpUcD3p+22j3TbJZlII=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W6hFqDMAl8MPgF7sVvxYcttKlz47ROjJL27/9gYWBWX4BdJb6
	pYOmOPthzx/6reWjgCh3RWTVpvqIvj7kzVCPutnV/Wn6dcDf6zUH9DEpVlb9Y5htVebwLknpOBe
	lViKwm+nR/vguZ7e4NtOhB7TnHs5rHYboAzV5kCnUq3XMcnO+IMIaeHwlKkL8S+UUaDA=
X-Gm-Gg: AZFdTZdQ2mieJ/HKKfWcfGDNlwf8d8D7TVcySf6jaUhzCRZwTxJ+gKnmZpUkJqvDgmx
	DbYl7BBx+1B+81ciRuhZrb9H2EEZxQIQofjRhz3k+cVkcceMXdC8q2N5cmEA75BxenjOjiFsvGD
	FmtCMacr24iRoidv58HmT38Iby7IyL0Udh23wFNNXDL0aRiKdEGWwJ9RdJSiem1o1FvSVWVJDe5
	jRwPH9IgDOJhPn4oEoYMG0+Fg6jdhhe11ii1pHig+hIEGXBqnzsqxabPIPhm0u1BLCizgGDPuPR
	IuIjXZ2JoJn9GScpN6e9bKs2fNnhMdCTnW4F4lyRuq1pAjGizb6/bxJOolZJkK0ehtlfpvmwnby
	NLtHGPKL12taCmhbW35BLAoVY93QNsfDAH5i6TUPR4adkcKWTHmIzhU/ZqjB/xNgfjXs2LrzlAe
	5BIXZyVSTtusAYDuGJn6iQusfuJLNHVd09zVw=
X-Received: by 2002:a05:6a00:2c94:b0:8a9:b07c:7715 with SMTP id d2e1a72fcca58-8c8792a497dmr21204707b3a.1.1795749037874;
        Thu, 26 Nov 2026 19:10:37 -0800 (PST)
X-Received: by 2002:a05:6a00:2c94:b0:8a9:b07c:7715 with SMTP id d2e1a72fcca58-8c8792a497dmr21204668b3a.1.1795749037352;
        Thu, 26 Nov 2026 19:10:37 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm12157354b3a.36.2026.11.26.19.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:10:36 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:10:10 +0800
Subject: [PATCH v2 3/4] arm64: dts: qcom: kaanapali: Add CoreSight nodes
 for APSS debug block
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
Message-Id: <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-3-42d47474a67a@qti.qualcomm.com>
References: <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-0-42d47474a67a@qti.qualcomm.com>
In-Reply-To: <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-0-42d47474a67a@qti.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795749022; l=12581;
 i=jiegan@qti.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=6dNHUawBWHNmdzEFROq4a+8fb7b6pspVeO7KwlQmtW8=;
 b=65FJDxdc93dVlN/BIHj89a8vnmYnZcFnby7m/hwPkM8kkcxu9ZflnI8VNr9TIPoU2ZMsx7tXY
 HkgIbyRwTCVAMSL8jsFNWcetVSuxm3vtikOYxb9E8LuAvX+IITrboUm
X-Developer-Key: i=jiegan@qti.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxMiBTYWx0ZWRfX2ZmYEYFRl+Jx
 BgNxWzWekQTEvOWbSGgQMI07oLTHXoN+O2yzO49IM9oWBfhWIsBBEKihQQsnA0qGXPQPpMSghAJ
 jjZ4nIdB7xh88Ot3T6Gu1LvKx+025PA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxMiBTYWx0ZWRfXwrjj15B2vwOm
 m+wzPRgC9WyutjceTtMryTQvRl8aXuc1DYA6bEFIjuxFgEtBJlGTC6W137oO3/tLG+qW3afQGeq
 50/+5OiHqT/8ZMHsbuJtBoj8HUmq6xoHyM2JwqL6y+KYrsNaFLeseQlrc7Wrc08WvFqsC7HNSPA
 AwlLb0ckCgSfO0CZzd6RFv8W5QeU7CqsaFypW6UBwC7289lMVqlL+XI4Vc6W4SIG8lTchgddNOy
 +keqbs7zkozKZpA2nzotD6PaluxnA/M5fNCDS0WlEB7q0MTzKC7cMQa74FLOraRFLO47NKccc+I
 Ti7DZt+bNSQ+SeO/RVLhqq9eTUBxJ2Lt5RE8A8ypl+Nom5zX/84HIZx5xyDGl5tDIeDieLiDvGC
 T3mCumzvkb5kGx7TOPqzDLcDNolPGnweYguIVZx7I+qDpggqBWW5apY64tEIvEVukgPTn7r3mjZ
 QPQ4w7kan7qTblnIMVg==
X-Proofpoint-ORIG-GUID: 46NOZBMBhnOfxS422eC_VGUvSo7w4wfe
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b08f4ae cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fu4ftQ_iHlGAbQNs3gsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 46NOZBMBhnOfxS422eC_VGUvSo7w4wfe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270012

The APSS debug block is built with CoreSight devices like ETE,
replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
ETM trace.

The replicator, funnel and TMC ETF nodes in this block are physically
powered by the CPU cluster power rail rather than by a dedicated always-on
rail. Add a power-domains property referencing the cluster_pd domain to
each of these nodes, so their power state is tied to the CPU cluster
domain and the runtime PM core can power the domain on before the
devices are accessed and let it be powered off otherwise.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 567 ++++++++++++++++++++++++++++++++
 1 file changed, 567 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 132577d540bf..874dcc6a6704 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -219,6 +219,110 @@ domain_ss3: domain-sleep-0 {
 		};
 	};
 
+	ete-0 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu0>;
+
+		out-ports {
+			port {
+				etm0_out: endpoint {
+					remote-endpoint = <&ncc0_0_rep_in>;
+				};
+			};
+		};
+	};
+
+	ete-1 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu1>;
+
+		out-ports {
+			port {
+				etm1_out: endpoint {
+					remote-endpoint = <&ncc0_1_rep_in>;
+				};
+			};
+		};
+	};
+
+	ete-2 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu2>;
+
+		out-ports {
+			port {
+				etm2_out: endpoint {
+					remote-endpoint = <&ncc0_2_rep_in>;
+				};
+			};
+		};
+	};
+
+	ete-3 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu3>;
+
+		out-ports {
+			port {
+				etm3_out: endpoint {
+					remote-endpoint = <&ncc0_3_rep_in>;
+				};
+			};
+		};
+	};
+
+	ete-4 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu4>;
+
+		out-ports {
+			port {
+				etm4_out: endpoint {
+					remote-endpoint = <&ncc0_4_rep_in>;
+				};
+			};
+		};
+	};
+
+	ete-5 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu5>;
+
+		out-ports {
+			port {
+				etm5_out: endpoint {
+					remote-endpoint = <&ncc0_5_rep_in>;
+				};
+			};
+		};
+	};
+
+	ete-6 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu6>;
+
+		out-ports {
+			port {
+				etm6_out: endpoint {
+					remote-endpoint = <&ncc1_0_rep_in>;
+				};
+			};
+		};
+	};
+
+	ete-7 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu7>;
+
+		out-ports {
+			port {
+				etm7_out: endpoint {
+					remote-endpoint = <&ncc1_1_rep_in>;
+				};
+			};
+		};
+	};
+
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-kaanapali", "qcom,scm";
@@ -5593,6 +5697,14 @@ tn_ag_in37: endpoint {
 						remote-endpoint = <&tpdm_ipcc_cmb3_out>;
 					};
 				};
+
+				port@36 {
+					reg = <0x36>;
+
+					tn_ag_in54: endpoint {
+						remote-endpoint = <&apss_funnel_out>;
+					};
+				};
 			};
 
 			out-ports {
@@ -5878,6 +5990,43 @@ tpdm_ipa_out: endpoint {
 			};
 		};
 
+		funnel@12080000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x12080000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					apss_funnel_in0: endpoint {
+						remote-endpoint = <&ncc0_etf_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					apss_funnel_in1: endpoint {
+						remote-endpoint = <&ncc1_etf_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					apss_funnel_out: endpoint {
+						remote-endpoint = <&tn_ag_in54>;
+					};
+				};
+			};
+		};
+
 		sram@14680000 {
 			compatible = "qcom,kaanapali-imem", "mmio-sram";
 			reg = <0x0 0x14680000 0x0 0x1000>;
@@ -6271,6 +6420,424 @@ rpmhpd_opp_super_turbo_no_cpr: opp-480 {
 			};
 		};
 
+		funnel@1d021000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x1d021000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					ncc0_2_funnel_in2: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_2_funnel_out: endpoint {
+						remote-endpoint = <&ncc0_etf_in>;
+					};
+				};
+			};
+		};
+
+		tmc@1d029000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x1d029000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_etf_in: endpoint {
+						remote-endpoint = <&ncc0_2_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_etf_out: endpoint {
+						remote-endpoint = <&apss_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@1d081000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x1d081000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ncc0_1_funnel_in0: endpoint {
+						remote-endpoint = <&ncc0_0_rep_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ncc0_1_funnel_in1: endpoint {
+						remote-endpoint = <&ncc0_1_rep_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ncc0_1_funnel_in2: endpoint {
+						remote-endpoint = <&ncc0_2_rep_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					ncc0_1_funnel_in3: endpoint {
+						remote-endpoint = <&ncc0_3_rep_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					ncc0_1_funnel_in4: endpoint {
+						remote-endpoint = <&ncc0_4_rep_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					ncc0_1_funnel_in5: endpoint {
+						remote-endpoint = <&ncc0_5_rep_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_1_funnel_out: endpoint {
+						remote-endpoint = <&ncc0_2_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		replicator@1d090000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d090000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_0_rep_in: endpoint {
+						remote-endpoint = <&etm0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_0_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@1d0a0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d0a0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_1_rep_in: endpoint {
+						remote-endpoint = <&etm1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_1_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		replicator@1d0b0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d0b0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_2_rep_in: endpoint {
+						remote-endpoint = <&etm2_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_2_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		replicator@1d0c0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d0c0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_3_rep_in: endpoint {
+						remote-endpoint = <&etm3_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_3_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in3>;
+					};
+				};
+			};
+		};
+
+		replicator@1d0d0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d0d0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_4_rep_in: endpoint {
+						remote-endpoint = <&etm4_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_4_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in4>;
+					};
+				};
+			};
+		};
+
+		replicator@1d0e0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d0e0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_5_rep_in: endpoint {
+						remote-endpoint = <&etm5_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_5_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in5>;
+					};
+				};
+			};
+		};
+
+		funnel@1d121000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x1d121000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					ncc1_2_funnel_in2: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_2_funnel_out: endpoint {
+						remote-endpoint = <&ncc1_etf_in>;
+					};
+				};
+			};
+		};
+
+		tmc@1d129000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x1d129000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
+
+			in-ports {
+				port {
+					ncc1_etf_in: endpoint {
+						remote-endpoint = <&ncc1_2_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_etf_out: endpoint {
+						remote-endpoint = <&apss_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@1d181000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x1d181000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ncc1_1_funnel_in0: endpoint {
+						remote-endpoint = <&ncc1_0_rep_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ncc1_1_funnel_in1: endpoint {
+						remote-endpoint = <&ncc1_1_rep_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_1_funnel_out: endpoint {
+						remote-endpoint = <&ncc1_2_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		replicator@1d190000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d190000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
+
+			in-ports {
+				port {
+					ncc1_0_rep_in: endpoint {
+						remote-endpoint = <&etm6_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_0_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@1d1a0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d1a0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
+
+			in-ports {
+				port {
+					ncc1_1_rep_in: endpoint {
+						remote-endpoint = <&etm7_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_1_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in1>;
+					};
+				};
+			};
+		};
+
 		efuse@221c8000 {
 			compatible = "qcom,kaanapali-qfprom", "qcom,qfprom";
 			reg = <0x0 0x221c8000 0x0 0x1000>;

-- 
2.34.1

