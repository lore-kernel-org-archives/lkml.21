Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754306;
	b=QZzp3EKiKo0Rzfur2XmB1LrJYcXDvJo/RNKTYJngDyETk2Q2L5rgVNXUCh4SccTxfw+P
	 3p5ra0Oq6oAngQzC8SPntTZ+JUG5xoKGgJuANXPcSmvJFF70Z5i834DhknS0dRQo/XIO3
	 5YuOHte+AyF6pn2NK0FI+3u98eFLEdeTs35Wo7IhX1U6LOHgExHkmElZrKIUjjDUfRIHJ
	 uwzk3ENKf4Q6hjYO24jbV936EmTI9+igbc2C1UxKEfVGtvgaWPGhbJ29quIAGRV0K9wek
	 iYzoKGHhdhHzckhCB/eprubp5j64D+yfBzmBoyMq16J3ybLqW+4Iu6NQiix9DMMJ8tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754306;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZQyzN7pTN5+1O3YedoCjEDAHpu6EOQv/+RtUHNWfFEg=;
	b=h63hAF0mJWmK0QvUXilGaey0VrDH04qFEwDg67Di4fyR9CI/3mDJ0t2jujH01FUhKOlw
	 xnVfrNFgNqnEGYL7KoCgTZZrP1EmrDuI21zAQVQizTitNrzwakNEWZUG5uchaaNYgoxGR
	 YK1UpBYa+6lHQVXoR2/xhfbAVs9dE3U7m30ZCk/q+sIA9S4Awm5QSczgSmAArqTqDOSRE
	 BjNksyFeybroipn5EisHbsvtkxTX/YKm5c9xw0onqOdVozmJOsuUuy09WTfjPKaaO5mTm
	 ZXC/7q9RDFDapwN8nvSrpKFErR2UytSo/a8uIQpCHdHVTzzUqvUBhLsBCpw0JeumHAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XCysWC9D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JWlWIv4T;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEA3606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDEA3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XCysWC9D;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JWlWIv4T
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR0LwgM2241401
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZQyzN7pTN5+1O3YedoCjEDAHpu6EOQv/+RtUHNWfFEg=; b=XCysWC9DQaFginXW
	M3EW5HJivHisqrOtazrKTcE16yqYtoaJW4o1OZU9xLzhcJnXembuizj0YKiEUASh
	/kaL1BNXmTf4xc5Vo2a2JEGVn0MFUq1hnqmYK/CnCWL5dN3I9WwwqAXGABTAtNy9
	e5ZF3W5SUFnSW5B+tIgtUv0ZfZNrXbRQ7IaNpJbAFP697yiymKwZ0lHHLJZS32EW
	uZyniB6Y5lBcA78WkKFmVZIvIMck9Lm892O5Hbeoawe297gjIwlqetIIqbcNEZK9
	xGt8V0Dl095KSEDBAt4Jx+tNc2RJ8aDY3PVzPjx/TEt7HxY0pYDLPHG8xYJMBT/9
	AVNuNA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne3h2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:38:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b421417c3cso6617471a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795754304; x=1796359104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQyzN7pTN5+1O3YedoCjEDAHpu6EOQv/+RtUHNWfFEg=;
        b=JWlWIv4T2hj8ycRMqfSCszlO/y02WqCgvsO7KXYWn9UU2hRJCfRMeNwg05x2nuR8Jv
         eCIQU1ZXK/3OlrCSVEVu7pCk1BkPRb/+vROB4Y+L4EATESo33f1l4yL4CxDe7QJUj/S4
         DOdBkl0VGbEqdEPcDuuUnsgQ1TiiIv8CrrrErV4zS6PviLqTF6N1dRdbRdqzyPc4vR45
         7ASOI/Tc6v6cG4Y8/+gx5S4X38S336mGCc982zviR7Aof3so7DUxAp19+h+NbqxNfcEo
         i+J6vnNtOUqkbSp8JNgfr4Y6OsObiCN9GhPmmUek9cXRDwCaBhVwZYnH7BttAyJbFhA2
         TX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754304; x=1796359104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZQyzN7pTN5+1O3YedoCjEDAHpu6EOQv/+RtUHNWfFEg=;
        b=CvUEWuAwi9oM5aeDc0Cs8Esl3FqyXOfwSZ5mGMZc5D69BuwUnpDrRAuaQxOS1Mj2rY
         kEgSJOraMzZLtbjvPdvE9ziQ3YCXuFZenudQkemFhAQ3kbMUc8K9kzPjScTqaWfl0SMi
         G69P6aiNEN4Hck/V05RjkkQhPkXFjgpCfZZD/v/tA4rFOKyNnOFjpO+ryrzUMXJ8qMY5
         N0G1uUFfApksJkTVSFwLa/KrhQGXEsfuI+dVcrGCEdPAt3mqtw1//D3PHHlnTGJKhQmm
         TDzfAZ120viQMPnldGYAc1iXUvoxZYP0pPIzaMKsFPuPyChwoeDnA7gI+B+yvS+ka6ma
         ambA==
X-Forwarded-Encrypted: i=1; AL+hErH0Z9vXiOZlksx3zgYwnU5UeTB9EaSiyqJ60u5aSfvmOJmoITCevVOJxmoVt2WybEvU6yWjX79y1kBxwSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kbT/pZef7zxXPXmZ1BJwVUn7yu0HJ5WAaLuYF0sJA+8BH8qUw
	NJ+EFSZX7EmPZTXaVDyld46+ixHtj+ptnZJ//5yfpXlFxsZYzVPJTJ1DQS4FdCpGnkLwWVRPNQz
	ipRMZl7V8vQ3fgXFlCADAVWnpCo7xh9dtXPR6Wj9j9u7CDlV3lNz13irCmbFklI0lIoY=
X-Gm-Gg: AZFdTZcJ4RTok/2x5M4XnMi2OOCF059d0tXpgvvCoHk3M8xGz72l1zCSJGSrmaMTbXV
	h/XgsbkJ2Nn4XPxZTce14NXOfXVU7RaAdf9qzNDjaM7+jcbH4A3Uo+ghIZdte3rUXgzP49Ki9T1
	eBreGE9pN+5PYNf5/ZfI5Wf+K0t+29XW6By8KggKKG7JrGjg7D/0o3639ilLdto8Jx2Fh2VHoPT
	b7emmD4X3IXyUyIDIKiBEcUNYdQ96qKw1e0BabevmOyz8GxnxRdnbtqqqTYwxpyYWTuE8WGeNJK
	auIISNEFCPmpc7akmaS+FiwMuJEkmt1CVArdG+/0GYcs91tazyElapeOtV4rpwCEUbXHEznxoJn
	c5Pp7cm0MVKpS4lAqxTY/QpQzjCbocfHfeTNSr4LU0nb0lH0pAClaS6e3n7OxRJaA+8B+LjVMmo
	Dakr2+VjhAYdee9AMT0QDHsXo/5Y0DfT2v1fw=
X-Received: by 2002:a17:90a:d2cf:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3b41c8fed4bmr20193980a91.31.1795754303390;
        Thu, 26 Nov 2026 20:38:23 -0800 (PST)
X-Received: by 2002:a17:90a:d2cf:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3b41c8fed4bmr20193952a91.31.1795754302784;
        Thu, 26 Nov 2026 20:38:22 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm38823918a91.5.2026.11.26.20.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:38:22 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:37:35 +0800
Subject: [PATCH v3 2/4] arm64: dts: qcom: sm8750: Add CoreSight nodes for
 APSS debug block
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
Message-Id: <20261127-add-etm-devices-for-multiple-qcom-platforms-v3-2-0037736dfbc1@qti.qualcomm.com>
References: <20261127-add-etm-devices-for-multiple-qcom-platforms-v3-0-0037736dfbc1@qti.qualcomm.com>
In-Reply-To: <20261127-add-etm-devices-for-multiple-qcom-platforms-v3-0-0037736dfbc1@qti.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795754291; l=13075;
 i=jiegan@qti.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ThG3RVFUivNbnmhH5oDo/6L6HD4azRsioolXvpbcaYk=;
 b=YxEQOGQAdBnL8MD9NNVzhQaEXiPzcFqPwcM3cTGsD0rzUpE8hcXB5oqWZXNsSPA0Bor3MI+BO
 0Hl209nLuc9C5hnQ+hHKMUgEAUeX+cy6SH6RId6+IoGaFedAsYFUAo4
X-Developer-Key: i=jiegan@qti.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b090940 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1maxGOkvq1oy3pDCtGYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxOCBTYWx0ZWRfX/CgoAkoj6IoD
 3ttYLHno7QZ4trr2y1Z0Hptxp3spHGXpgopkxcXCFYeEJfJC/JUjVNakSdkgpS/x93rpogG3KAi
 I+OWtZYV1Pk0rwgijjsCB67wfJ32ReOlI34Bz0h23aID/u4WtmA7nsBAbiPJOsGUStyGmJQKQci
 Aiau0TpbvoJrUoGSSltP0akI1R5ItkNHOL+eZG3GkFhU86aTwrhuP1zTbdo6SSYfjq7fTKwgWZI
 cNERxxBywoQjGrjRIyMT37hzcyFgG6LbMUXXBWXIuN4z2IOiqyvx71KGJd1Y94UpnH1C7Mj29NF
 JQydIAEC+jrPREm94wzjZZuIMtPUHL5FKpqa+XQ37n56H3NXLQF/M0GTJC+AHmA/TN01aaLshx+
 fzo/pVTma6wNNbUui0PrhwZsfk24VEBnq27Cx53+31hjmVfcWO0az4GymJAArD06jsexfSa7U/1
 Tb6LGatevzCIX48KWPA==
X-Proofpoint-GUID: ikyxge7y61iad15nLd0V3wv1Cd4dN_Km
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxOCBTYWx0ZWRfX1+dglECaJP47
 tN84pblg6o0eioRO3D/ua6rLVobrj1G/zLYx50XnGwUF/YTB2KQ0JpRnLfRjEK/Z4hnlQZI0TF2
 4RRhvP24XfBQWgDvHfJ0CLiO6n3JQRU=
X-Proofpoint-ORIG-GUID: ikyxge7y61iad15nLd0V3wv1Cd4dN_Km
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270018

The APSS debug block is built with CoreSight devices like ETM,
replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
ETM trace.

The replicator, funnel and TMC ETF nodes in this block are physically
powered by the CPU cluster power rail rather than by a dedicated always-on
rail. Add a power-domains property referencing the corresponding
cluster0_pd/cluster1_pd domain to each of these nodes, so their power
state is tied to the CPU cluster domain and the runtime PM core can
power the domain on before the devices are accessed and let it be
powered off otherwise.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 599 +++++++++++++++++++++++++++++++++++
 1 file changed, 599 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index d8a853c31eeb..3411dd80b670 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -216,6 +216,142 @@ domain_ss3: domain-sleep-0 {
 		};
 	};
 
+	etm-0 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu0>;
+		qcom,skip-power-up;
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
+	etm-1 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu1>;
+		qcom,skip-power-up;
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
+	etm-2 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu2>;
+		qcom,skip-power-up;
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
+	etm-3 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu3>;
+		qcom,skip-power-up;
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
+	etm-4 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu4>;
+		qcom,skip-power-up;
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
+	etm-5 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu5>;
+		qcom,skip-power-up;
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
+	etm-6 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu6>;
+		qcom,skip-power-up;
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
+	etm-7 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu7>;
+		qcom,skip-power-up;
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
 			compatible = "qcom,scm-sm8750", "qcom,scm";
@@ -5294,6 +5430,14 @@ tn_ag_in32: endpoint {
 						remote-endpoint = <&tpdm_rdpm_cmb2_out>;
 					};
 				};
+
+				port@21 {
+					reg = <0x21>;
+
+					tn_ag_in33: endpoint {
+						remote-endpoint = <&apss_funnel_out>;
+					};
+				};
 			};
 
 			out-ports {
@@ -5571,6 +5715,461 @@ tpdm_swao_out: endpoint {
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
+						remote-endpoint = <&tn_ag_in33>;
+					};
+				};
+			};
+		};
+
+		funnel@13401000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x13401000 0x0 0x1000>;
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
+		tmc@13409000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x13409000 0x0 0x1000>;
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
+		funnel@13481000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x13481000 0x0 0x1000>;
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
+		replicator@13490000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x13490000 0x0 0x1000>;
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
+		replicator@134a0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x134a0000 0x0 0x1000>;
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
+		replicator@134b0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x134b0000 0x0 0x1000>;
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
+		replicator@134c0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x134c0000 0x0 0x1000>;
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
+		replicator@134d0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x134d0000 0x0 0x1000>;
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
+		replicator@134e0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x134e0000 0x0 0x1000>;
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
+		funnel@13d01000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x13d01000 0x0 0x1000>;
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
+		tmc@13d09000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x13d09000 0x0 0x1000>;
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
+		funnel@13d81000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x13d81000 0x0 0x1000>;
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
+		replicator@13d90000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x13d90000 0x0 0x1000>;
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
+		replicator@13da0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x13da0000 0x0 0x1000>;
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
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sm8750-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x100000>;

-- 
2.34.1

