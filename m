Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989014;
	b=BAQs0bN2o1X17Bi0pjchuJfpwzzoQ10+CMO5/gQP35CDT5SEVdyb42bzoK+NpRNUbDWC
	 y3v+WlBnDX7uJCUsuZqYbxDcs1ZqDqo3KLs16WPjNAA8TQxTXoBRx8vkz8EUn5UBluG1r
	 Rb523kDbxflQx5A5sREER7c3jDA5ATAVuDw5MIgyrA47a6qo3sgUi5xQgpOHROZshfrAw
	 QIPSsZaG5adrTJsAFOr9qr7Rmhcz5hYypGBcrnNevdHrULc9PEIsornsK9bSKJyDo/ECi
	 ieZq3sGJQy1hui2iU63c1/R1kNDQf2Dcmr8F2UI8hu8DaRlkNkUmyzQcVar6EW6371w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989014;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
	b=FRs0S7t68zbiTMx1Gik3WbhzAbrvRpdskm59MpvWUww5gOwhZUHona/9BclehvmZWr8e
	 ieHdi924nu8P07VSPZ4UYeynzRr/CPPYvp/W9WEaKCp/TpQBPo59SwGtTf6VOiJZd9hCL
	 z6SUFU0AjAyd6I+nPvSKpxSfS4x59dP1rlZJEQ+hmzHdeX3QoKGRqwwSnUf6/mulhazFD
	 +/uJWirAbG7WsAh8W42NswPkpuRalsrOt8klC2iwh+IgvGq5jmkdMq++7zk3odXRAZnvD
	 /rqRrWhVLQjjWF/3yo+Mh34WitD6nzWfTPdOWhcOV32NnR8nrB81ek9Sgk/K3lL/I1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPnE0Ajj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z8SL/gwL";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAA6606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AAA6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPnE0Ajj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z8SL/gwL
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V1Ml1430592
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=CPnE0AjjmS1OKti+
	jsKcwPsoZ7wslvTnpMnC+xroU+ZLf5jzJ28cCteayLBq+8kKHpBW8OL/FFwJtqzA
	sWnow2ODDb7TyWFSpNQAonyQSzlVleAO6O6F83fp56lQn8v2++HSfZ7/qhc48L6O
	uDPEs1r2yo5DGDYdRr5PJc9yp0umRg4BDNSLrBNw81SzqQfjNwRIYbiJ9AgUm4SX
	bB+ZYwlWwWmhKA/oVnxAbA+E8rXa4vfiHm8jdjkTbDsNkcl2VscFDJAyC2AZa6n6
	JKPV1B/HpSGNHZLQm1xKBjwEaMMFjPWHwTBdRY/vY9P4maveoajbK/ziMlO0/1Fx
	Y2nk5w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv91x1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:03:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3a9ee822fso934631a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989013; x=1795593813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=Z8SL/gwLauMEuWkbPD22Yro/g8ltM3JqAbtHfcwH+9NsNq7lAqRK1kXVUPzLH9peMX
         z5NRWAHrUqGTv6uj/qDM1iVaqQIT67MDh1cFdVzOSVBt12Jz6g9w059h7WD5Q/j2MpjL
         vNbKIwcIUo29VPHYfFLNE8DL+bBWexuMwZFyv3Gw3Ydp2Tp7+riH9HWaQ+ZMmctHUh5z
         POZKplCwY5e9gaB0qwhQehDPQjF699IroUJx0RVXB6aEHF0vUP7FPGBkyWiHewzA/m4U
         PmUltLE4LfP2IuIb8CVETXL1O98+83Hv1fWYXOtcaqVql8jNfapXK1yX8EQInX/+2j6g
         gDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989013; x=1795593813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=e40DuzV/QevE2lNQ0RKkq/o7kdUn04Jsk+QR6sm+VQCWQe7ZapDPAg6MsIuIo3irxo
         ukj7rLYc55ogPA1nFeapZXdZfz0a8ZUX+0L6c4SuiIJkPB5ErsSthr8wc7Kshpp2N4Jj
         KtbsbkBACJpEvUCCY3uW9O8GR/8/newMy2FbrouW6QibmGrwnj03dGxRNJHfeSg8BJiW
         8OBD96q+MJn53awmbe3BHAo3sFXQABOnD0kfjRfRLWCaVDvrFSto6O+42MtP97ADG6w7
         9bSicCt527bGQOCN8v7sRroFwdaftFWbEuE9xxhjMtlJLHnfitoSliLEJWtu9DNX1dvW
         Y1ew==
X-Forwarded-Encrypted: i=1; AL+hErEavbzKGjvFnjSw6yFrfMnvO28c71s94qHignI3vKbk+96fvxZztItAbYJzyC1PooBjUVkx0Pf6Mj6Gg/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oDu7MZh5Rm09MnBqeTynTQO264rE9NjZJh08li3opYfY/X/a4
	/HEZUG3magrBFQbtluVij1+7wVhgv+54BAvuRjGwsnZYVHX4XTagO67SoZRDBpwsQ8U5OTXJ/PO
	w5Cx4NFfYt6R/Yw9CsNgZ2YSjUP0eVxRvQ8PDhrerF4UeNVWkiFHujHGRPLFQfny23BU=
X-Gm-Gg: AZFdTZfzVYHip20az2swT3oFxNrv1Ftr+gZJJDKcQ0VVlYA50OYdW/k7TZ/BISdSDTv
	S3Rky0DagmPsIEb8A6mNcaE+uUCPJLtutOzD0p0Y6d9m2wy59lDMU4ImHdpLXnacs4wuIN5oj3n
	+ANU58xw8bHs7hsZCohvCIxoQ5vmjc98PwBOKHumun/Jd0YF89G9afrJdyi4Lj+wmkTgtEGqVlE
	Ltb1mI0MWsVPFYXRubMw5z5Mt0Gg/M31Tb1PYGG9TnS0JYNCQBdc8U1fCywq3WWKsGhKZBrAskk
	HbCZ7XOLbpSAlpzzXH9N+un1LdfGqz69pgQBGWZstzA0FIWLs9fNu9OWUAQFb+HiL/Bawqzckrc
	n3qjDvc/KuRADVugIM3Wk5oWrcMiWfyihI7nBv4l/JYxKZhZzlJ4A/IuyDcy6MdaTWEbddm+yDg
	PjIFh2GOM4KftG7ijiMpCG9hH8cKk+lon4BF7T
X-Received: by 2002:a17:90b:5803:b0:3b3:bd07:6646 with SMTP id 98e67ed59e1d1-3b3d07e0c33mr1865338a91.52.1794989013182;
        Wed, 18 Nov 2026 00:03:33 -0800 (PST)
X-Received: by 2002:a17:90b:5803:b0:3b3:bd07:6646 with SMTP id 98e67ed59e1d1-3b3d07e0c33mr1865315a91.52.1794989012779;
        Wed, 18 Nov 2026 00:03:32 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:03:32 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:29 +0800
Subject: [PATCH v23 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
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
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-8-67fd9db6bc0e@oss.qualcomm.com>
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988961; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Dgum6JnAYvNy94FsJPuCnHsZTgptoysTqIYu+BN7gI=;
 b=1ShHKwidmmYkWB+xKUgzw/Jw2Y3OUqb+V+xbSEaF8Ffh8U89bJa1sDw3eeoz9H1yx45kKuMKY
 C7yNqqDtpVyCXy4QWjNKDYSswiheVEZlW9MQHcJ8tC5L+NyNOoKN/Ba
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX30B/6C/g+38i
 pdWg4Sm3oWgMivR9cgSBuDSEBAW6mFJzQFV7nY6To4LbaoyRWhr8G2CG4gW3cR4Ir87mVhAAHdM
 qyFkU9leRrGwpVKxQI7DIc1vch3D5cSiyUSDi5YyXkA+65MDwitWRA5S8dWWHzAifTESi4Z8FIj
 wJAnXH5TosYYVU/h6ffOf5EUIYUXY2Em2+FP2eFbqmGnvxKhz1/fSeLt2ACye3NRXEc8Jpbqc9d
 DlfvaLxXn0L3nmJGwuNnaonhJp+6DD1rY9HCpbkp1Eo3YZCcTsUXFkQRIxXh2/nYFKoFG6SUytf
 FSgejjMG9yP984THEsLuIWdyOsMNIMg38hNgsDIENuVUJrJePJyiPsk1e7mIaVU9fDZzHC28M8K
 oec1PgmFomv0acXCXCqlGybJ0mj9dO1E/Qi5UhTXx73aY5UeH6rTLgiqtJpKM0Us8escLGHosgA
 BIIhQ6Qcco8y0GEL4pQ==
X-Proofpoint-GUID: dA6jChRBuRrNdN0TGnzTUgsl20HVjwfB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfXyGeQZDTnN2dr
 b59CUEPD1iG40wgjDecQzi6u/a9i+ZQIv8YVyy4F9ih64MKD3idgIMsREcOqSyEvgYlbJzmAYgl
 o8wsi+AEERZT91M4gHbXgCZsZXGxo6c=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd5bd5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: dA6jChRBuRrNdN0TGnzTUgsl20HVjwfB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..852a1142100f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3132,6 +3132,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1

