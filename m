Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538680;
	b=hfiqhQVbzhaCiLk/mV6KN7IKo3uX5oxk+bSy+pSe40fzVb8R82+hjGtq2Rxb31rlxEFc
	 eYZV+4ND8GW/AzWv1DuAiEB83HNXlf9BlVSetg3iX8UPxa/9B2l9sJGurOX/dUam4+WKg
	 4gOsYjyv9p0vaKbBsuETMbgDTSCT2Qj0KL9zjrrbmv4Ojd9SHZaoKRNDXCYm5TUE9tWGO
	 jB04pZ2KMl2Z2pV8b5/tKfJJBs9HrTcvhDHDdWoA5BYnkX5Jwp84TfgDN7f7yt+jrEUil
	 vI8hJnCtfV8h2coRWBTNAMkbtYjPJPan/KeXbT0cKZUzSs6jDN9gBOk03/x/VIgyZGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538680;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
	b=iyt+9DldK4tt7ymSnW/ysYaJBM5f4spvICZiIORQFOnWsaIzIljdkFEkgvbkGsdtfwRb
	 hRuTF2IUFZVw/95do04k8XdD6Jskd4wWgN8zYWrc+qEbAwxmk+mSODi0alxvp0B445+dP
	 WLTxwvXbRcyXZPXtZUoDxk3CuptQPDIzd5wQc0Gae4DbL+Z2JJbzzLpuXJACYFkPU4Tya
	 0L+VPfvJWwjyvKQ96tFdBkExob8ss0hCQNT9SeK9x9JBipiwYzQuUKjb3fjeRNZTAUj3P
	 DnX5BPGdVJckqzNVnkPQZKqJluPr1kZMmRsp0x5lYJ7VPtktazB8g/S/a/IMLQK/lSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqV0EkHY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WwfK8vbj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C4F606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0C4F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqV0EkHY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WwfK8vbj
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFKtme2569554
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=PqV0EkHYogXdhnHT
	AMpAdHDUXoutgpJcFFDj/H/HBwszQ/DuWwkZhOf8eXhnTAOQ1/LFKiNIg2Rh7vcj
	u5gpjtLcSjSa3/g5rVwBKmSqBLFH4B+v2T50OKvXrq6rtfvyL+UTVJzsBc0tOzRH
	vfYfk5cWC8Eo+ZW7X/pzW0kghOCEdFNTnRiLJSGBsL6JPPFZ6EJFOaoGYR5oQSKO
	3QBVFge19Mtx6CZbZLoSCFQ6+2LJCvMMfeku1bWgV9FwlY7HHng6tCHP7pxpNBvB
	dcONGAXd/Eses1gvWouu/rxQu8O1gB5bviTu+ayoyS7o6TuirSonfofRqtqlpoBh
	G7pLCg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6svem1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:44:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-384c78aa0dbso6595422eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538678; x=1796143478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=WwfK8vbjzNQjTPWyfPhdww9E884LGH2+XOe4GWGTsgzY/7tKKyayhv8OXIpaYJSeDt
         P+1/8HpVTqykzrrcN/vzych0PSkTTbkjoDMeXJTPy797rnuekzlq4HfJxksKfmFua7Rh
         sxZdA7JIFyFu+XFsjXgN5N2lrVDZJTKkE41ZxEaYxz7jUaNx3ht99LxJ+cef/kzapj7+
         PGGu388uV7YCZ2Ee1mUEIqEw/MxB7r0r37LYiS9Z7rRMNqLXua4yRMsHKM3NhT2maZTp
         DcSFdD6D1KdqsymUkdaODv28fX3/yjS62+LO9J7fuPX8FJ2W188rAH4VLUl4symh4Blg
         kQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538678; x=1796143478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=RdKcoNFOXRdIbwbqw8pTYaVdmUTHvMbCJK3N3iLSBIyyHGb3mRyCGGSVzbIx/RbmdE
         Aatms36AJS1M22XS8gcexMSlmHP5WO+N7yWe6lBaWFS1Zpc6tqBLMansI5C6YjV0LqzC
         eXpS55fBjNHhUM5x8kJC53egqUCf09rpYFvTXcBSExR0vBIPk7fp81cemLFzMg7D7Czw
         j/h5bRUvam7xceFLT9HHkvq5WMXMSARteACOiWHmFafOSS2Lvz061EV99r0GwNoskcRi
         VmCOg8b4owb0x5AgbQWEXoifNEydPpIauvb2zQk8td76YohZK6PSSM0R7Wzk8yktMuFQ
         oVCQ==
X-Forwarded-Encrypted: i=1; AL+hErG5H/dU3rfMUn3+XbyiHanmhXtceU0aaygq780Sj8h22dsDj3E8iGFDNHe5XRQBmAzF4W69ZRKwA5xCWA8=@vger.kernel.org
X-Gm-Message-State: APuU4Z++2H2PByfC8TrtxE8OvLv41TBxS2XOrA3blWfKRqSwUlTtLOru
	sjBjLlgonb/zwv4xNLHw+R4kZpAvmhQbIQUso4zE3QBj87QZGYeXj5kjzuhuctFgJOxcaedZlNc
	mqCmbnQ52mC2epYKpvqVuQzevmNGhtjGlqiCqUHydsn6OWMWXFwDGSpQoSZzTo55lChA=
X-Gm-Gg: AZFdTZefBaD0pWDcDtMaMKXzdt4ZDHtj3Ibzs+v5RA7pXlvPVTOaxlcsfGF7EeVqv61
	mlR9stY0mPF4b+k4KBZB+7i4RU9LR3caWcAKoWekfinRPxRy1PDfMo8jtLtlEk6ayOSfKdeO0kp
	vXCGp5XJWqFDGiBKZndSM+7OI1LTa63gTUOOGcyH090i7J0CW8I/DAAmllsr3UryjzMfcCo8Pq6
	WOepn6q/lVU62IZndoeRr0J4rjP/1nQYSq76zwvnIzY8Azd8MwReyhxD7thzrq0VLAmpbmGmtwu
	e62XG3sLrzqIMJKm3V51yDV0rS3X8DVMzMuV2zjp6u3v6TtOQ4qZPShJYsXdkgKUdAbDnwcBQY0
	efUa7pub0BdyF/nB9bEdIjLzKRRt4DTWHTXe2jtDsoYXxr5sXT4TMfHv/db1XBJ62UIjaNuxVpX
	QPGik8blFJJVW2facoIbliqz48jrPhDUR3Nazw+3JKYVk3EScUz8ye42BDVePM2H3DmFdPIFeLg
	YE=
X-Received: by 2002:a05:7300:dd46:b0:385:7762:e1a3 with SMTP id 5a478bee46e88-3857762e729mr14780131eec.24.1795538678046;
        Tue, 24 Nov 2026 08:44:38 -0800 (PST)
X-Received: by 2002:a05:7300:dd46:b0:385:7762:e1a3 with SMTP id 5a478bee46e88-3857762e729mr14780097eec.24.1795538677370;
        Tue, 24 Nov 2026 08:44:37 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:37 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:38 +0530
Subject: [PATCH ath-next v4 12/14] wifi: ath12k: add Wi-Fi 8 hw ops for
 QCN9575
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
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-12-1f5b87ece6a3@oss.qualcomm.com>
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: FR6uSYbmk1zKfSXDzPwq_yLAYi9IGnHX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXxjHeQ3OrtfgK
 y8Nq6GhOhh15kw6PYk5Q6RkSU/X2FJNC3p2dOGrblISP6k6ext9l8vC2ZhWY1sBPxzfNxpoJ1z/
 i+Ppl26lzcgwqTXm122oOgu0sTIQ15Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX/gGaQBk3vPjn
 SHTSEydihO86oHBuOTe0cEZ3IPm7iHphLCWD9LQKxFuQ9AAJIyiMNplx3YmAOjCMYwdWHUp6wBr
 QT+2L0wVJsF/WaIgqooqM9LN9o6vILJx/rnTGIVgAnWqnNmur0Fkxmqod+UNXfkfwwGELm88NgI
 rSFrhMwtmSfIbTD5aEebR41X3qgIkQcRM19kmsKP2pc8TZxyHzQAlalJm40QK4zOv8+65A0M7Z6
 KkEBx3IkudBZWs/fkFpQuS9ud/xyVaLdPcNDu5TN1263R1gZRXivJ7ovOumHbms7bRMB10HnH9Q
 iHrlxLn1ucUsURe7XunmfEle36I6CJHaRqYNIYISPsW3985TDZhieQVJXMXKS6fE1ZOuJT41E/Z
 hpmJmHliMKmCVVt3sFrDwjFq+U2nxb/yT4StjK8S2uO0wLIvf4u8D3NiQ7aIWtqQjy8N61kWvGV
 b11zEOOkBfXYmsEJ25g==
X-Proofpoint-ORIG-GUID: FR6uSYbmk1zKfSXDzPwq_yLAYi9IGnHX
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b05bef7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=L9wxWISAF5v3VASzmuUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240065

Implement hw_ops for QCN9575.

Add QCN9575 hw_ops (qcn9575_ops) in wifi8/hw.c implementing pdev/mac ID
mapping, srng ID lookup, and TX ring selector callbacks. Update the
QCN9575 hw params entry to use qcn9575_ops.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/hw.c | 38 +++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 74873fc5f3f3..92c897de16f4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -18,6 +18,42 @@
 #include "mhi.h"
 #include "wmi.h"
 
+static u8 ath12k_wifi8_hw_qcn9575_mac_from_pdev_id(int pdev_idx)
+{
+	return pdev_idx;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	return mac_id;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	/*
+	 * TODO: QCN9575 supports 2 radios (max_radios = 2). This currently
+	 * maps both radios to srng 0; per-radio srng mapping will be wired
+	 * in by an upcoming DP patch.
+	 */
+	return 0;
+}
+
+static u8 ath12k_wifi8_hw_get_ring_selector_qcn9575(struct sk_buff *skb)
+{
+	return smp_processor_id();
+}
+
+static const struct ath12k_hw_ops qcn9575_ops = {
+	.get_hw_mac_from_pdev_id = ath12k_wifi8_hw_qcn9575_mac_from_pdev_id,
+	.mac_id_to_pdev_id = ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575,
+	.mac_id_to_srng_id = ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575,
+	.get_ring_selector = ath12k_wifi8_hw_get_ring_selector_qcn9575,
+};
+
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
 		.name = "qcn9575 hw2.0",
@@ -37,7 +73,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.qmi_max_chunk_size = SZ_2M,
 		.internal_sleep_clock = false,
 
-		.hw_ops = NULL,
+		.hw_ops = &qcn9575_ops,
 		.ring_mask = NULL,
 
 		.host_ce_config = ath12k_wifi8_host_ce_config_qcn9575,

-- 
2.34.1

