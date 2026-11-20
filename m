Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164184;
	b=4kK6EyNbj+ef1gYWrqr8ggDkzx6/GZOc3+E/3Wb/tvLfadH4fRan/PEWfRXRIqu2CN9H
	 cm5XNupbTLxqNquez/kRnSIdM4ufGCVvoOjRQv4diYrmEPW0T7u+5dNHqcHiv1maPTafi
	 sDwuC5z8UvScnAX0hSV6taN/1g2/E8hQvYWuj5l99DMdmRqZ1cjyXlAfIWvmq00gnbzQF
	 1LYhf6XLlKe+j1WSg3rMEcPAzGzhER4fndb1B2dQbz6zohy/BSY8S7iO+6Xsf8YYrryWR
	 AC4dSNKB2BdcR3lhhU5uMFIAaW1rDj0u8Uzx6ycLId9F/zrJGUsY+DRO0+BIKQ7qV4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164184;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LOWLjAZnvwwYdES752KqdXc8VUTFIEjGHucmLOx00so=;
	b=LnL6dNWJAeKzAYwDZGtBfed3yd1RLZZiZFV5nqUkkfkTSNcECQsDieLgZaX1zyKTTVcY
	 7V3TXFKPj691fulMSaiNsOqJfawKvBlJUJbAryo80oknaFHdLaHmk/1DMlncUcTIw1GA3
	 mfL51sRnGcdKTon5M2mE5lGQqN8ObQw2RVrw4roerxSelGG8NH8trLqaqLulwCepmvBT/
	 r3jl6FY1W5uqZRkG3QqoDuSylqUBXyDXF8zXijiGxZlFjzERQBsJNUa8TrHzoxiKTcqzW
	 XRnACM6j8WbznqQ+IQZ89torEbL7KYFmyPOAnlg7hiv3tvs6ape/64ajpbhG51H0NIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ItsHc+4O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jb7ShmyF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A71B60A3831
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A71B60A3831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ItsHc+4O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jb7ShmyF
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fE0R758047
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LOWLjAZnvwwYdES752KqdXc8VUTFIEjGHucmLOx00so=; b=ItsHc+4OZO4Vc/aA
	bT6p3f4oe3j+Yut8OGR+vU425k8/QQhZFXjYhmMmiF2r5bB30HVZANeC9m4ozxSC
	VNHbC61pUeWXo/XrtYrHoaKXbZi03vplTnn3R0FfKlmnpDP37JeD7QHO86vCbr6y
	s3h8uyyBPdW+pka4nNlcC9jv0GeUHA3caKiXmyWuZTuKlgcO8r3NGCKU3QuGboOJ
	hKcvrRNhoqm+Ie0N3WuW03encFH3ajkSqfsRSPCpbFaszMjzp8gj8TsZl8jJe38t
	8HWf3bRTxfpqDQDznhw7m3al/wMEJNM/D5r5xVAdRmUomurlE5wzvB4p5rL7avO+
	d6KPUw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5tsqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:43:02 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso768167c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164181; x=1795768981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOWLjAZnvwwYdES752KqdXc8VUTFIEjGHucmLOx00so=;
        b=jb7ShmyF58yFVF2fBgXfn+x1Rg+604WbmB79WzgxRhHHuQxXzp7oEwrX8kujoSer3a
         Zdm7zafOpV59AwJb8KFqdBWhOAYRJ3fnScg+0gGSsF0WqBOrKzUxe/vq24wwG9SMgFC/
         7d1Ny5/NiO1H0vhpSpFVm4GLR/dAT5FlMrbJD/6szhM3pa19XvjVlLw6ws4JJsdQXGlo
         /VZyppkVDT6N/ExzRe/x5V7b4AdRcrYIjXo3aksj9LM8bT19/nRr4L8BYjwL1jCmvZoT
         DLI9XJKVx0GYZ4It9Q+A7ewsky15MtvbjZO1W+HodROFol3pK0QJ3ReYa1f+kZVYBV7+
         V+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164181; x=1795768981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LOWLjAZnvwwYdES752KqdXc8VUTFIEjGHucmLOx00so=;
        b=GX4ydwy6DWad2lly92pGeBZkH1u6kg+itAanchOeHgYgKBZK6ojLafSXOtee+5wu0j
         h5HQYlwm9bB2/EOFAYpbFgCXqx/pCxhKjbpruOSuCbJG0gNlxZfa9uadtVVVhU7AP94v
         qcT3fY4mWhu/tGGKyT+QaSkQ/awuORVn+Biq+q0j5WMtJWtXyDuStTmL6V73B2bhhvmI
         FVCHTljlR2/1eknvvqs/cCQRW9h97VIqTPdP0MJ1qhjzr3ROTeOfNbvmub35Og/Yanx3
         FjnGgp4UDc7qQS1NftDWcLrruxIO6Yfl+Q33gSlcBywrjaKGiEW7+7LmODStI7emTIWV
         LUFQ==
X-Forwarded-Encrypted: i=1; AL+hErFn2Ki+3gCcPz9RFiRXFF42n7zWrefvasA1m39ZnI/E9yR/bQzyHJMkZncV/Xuxa2XswZV3zpjFTblW6Fg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t2OS1V2jIGIFOR3WYmwbI6ikiyIzpVLFDyen7x6X4v+qv58LN
	RFfFutRZJr4+KzeLurB4ZqXveZnZLNGDXlhhS493JlsZ4I9olIbHNSdJiTZK/ai8e5P0DTiwDuf
	6TfCZzff48ZRTG4M+sKccIb6zinW6u+kQfWsItiDuYnysoc0+FBUyUctciMWXDlkWFVg=
X-Gm-Gg: AYBFou00ptMFIWtCO0xSnoCOB7mPbBqJkv/sgjdpEHQEQZANk6Wr86bULhy+a9n1PQQ
	4Xy5H+vAZ8cn7aoLK/YuQBbbAJDoMhQgV/vbWTuOMCZvOJGtxBoRsSlCuBO4Wpiyd8E+pcskkTO
	wc5S+xa+f/KFpEWR5zNFyA4z9Vjgnc4/QTAPfhcFyRU5SV3gD7b7tnIXSeOnZj61AiQjwECQVjC
	bHzXWgxoDxKCFD7Z2D3LOMc3bOlV+7A703pMDcI2uXfH7wVtt4zy6JoFa7n5hJU0H0Y2lYoxt+9
	w9XYpLf74sSZI0sPKKwF6nH3xUASC5sQws0hQLYl8EBKdPG7yVznjlWPvn7+b+RniBIHqPHPqLW
	JW6u6xpilXcsd6jPvgti0XJjG9MedWLdzVtdNt47Nh1K3D07/P6IIsgFNRi4hzAnY/hT5RTKp6C
	CFD5xSYhO9j2tQIaG0LhASL74=
X-Received: by 2002:a05:7022:3c14:b0:16f:c9db:c5af with SMTP id a92af1059eb24-1b5568a16c2mr1898698c88.11.1795164181031;
        Fri, 20 Nov 2026 00:43:01 -0800 (PST)
X-Received: by 2002:a05:7022:3c14:b0:16f:c9db:c5af with SMTP id a92af1059eb24-1b5568a16c2mr1898680c88.11.1795164180537;
        Fri, 20 Nov 2026 00:43:00 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:59 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:33 -0800
Subject: [PATCH ath-next v4 08/10] wifi: ath10k: trigger recovery on
 corrupted HTC bundle lookahead
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
Message-Id: <20261120-recovery-v4-v4-8-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=2640;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=JNWAJxwzcrnus/v8+vUlNw82d/v9JsIYdbkw7ZHl8Ms=;
 b=TljHYvJ8OgaTx4ZE7NZKHFpI/Q3Tg+zCoWfHBI6jepsjPn0wejHld5oa77qQzKUEBVkGG1i5E
 9FrviT3dU5ZCpT1TWemoC/YJRq6EJ4MTJWFeiBlVa1iB5C3K/N3DTK6
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX+7C7wZMoNBI6
 fZ6+KkXcgXDKcD2A0Yf4IT1Ws/v3wvyS75OemFLiQtr/ywMaet56j1ARq6phTiuadzyR+n2zWbo
 uetdfnYFk/EABxIgPGS4/ULk20F4rpw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX+AVwkOoNO5rz
 RxawvSjU+S2erBwB8IFy8FeLV3DJAF47q7zSBSlgtoifJ6rg9wqU2zGP2UtiUqc11Qi6NDCgh7r
 gynG7FDpQ8a982wqV5FjoApKVqilW7cI8Krtf7iTOfxgyQrv7V6lPlFGgR8scunqHYCp04J/RUR
 hbCVEqwVFg03MO+6ISIcRWr5i1XPRHH6fV8Iros9qrkQjd1sIzePtUVAIr0jsWpHAnmjx7Dxwax
 eMI9iSU22DFnlLFYK8ToB/JkpBpQI6UbIq0kYI3Y8uzbmorV0GndnsTxJXLrkHw5CUgCxmaJAv+
 hfBt3+Gg5FFQ7LlLX6p4ygYa3hwvMyx8Qrds/kVamRkxLT/Lr4BxQWZhZnJii2QgdN564/QOCj6
 L8Jy8lAacAK9AeCX38GhrBlPBeQa1ARaDh/bUX76DcQxfmrYA8GOhiGQAwrtCS9DX6M8ZxGXhdY
 SLqfGxXP6hZEoqbhjoA==
X-Proofpoint-GUID: 7DeEVPITF_ECDfa0i7sCDoZZ3mUvlLuP
X-Proofpoint-ORIG-GUID: 7DeEVPITF_ECDfa0i7sCDoZZ3mUvlLuP
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b000816 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1mh0D3slpp6jLL18LmcA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034

When firmware crashes, the SDIO interrupt handler may read a
corrupted RX lookahead whose header reports more messages than
ar->htc.max_msgs_per_htc_bundle. The driver then prints errors such
as:

  HTC bundle length 2322 exceeds maximum 32
  failed to allocate a bundle: -12
  failed to get pending recv messages: -12
  failed to process pending SDIO interrupts: -12

The handler returns -ENOMEM without consuming the mailbox lookahead
or checking the firmware-crash CPU interrupt. The SDIO interrupt
therefore remains asserted and ath10k_sdio_irq_handler() repeatedly
processes the same invalid lookahead.

Stress-test logs show that this interrupt storm can continue for
15 to 20 seconds before the firmware watchdog allows the crash
interrupt to be observed and recovery to start. RX remains stalled
and user traffic times out during this interval.

ath10k_sdio_mbox_rx_alloc() already triggers recovery when the
lookahead payload length exceeds ATH10K_HTC_MBOX_MAX_PAYLOAD_LENGTH.
A bundle count above max_msgs_per_htc_bundle is the same class of
corrupted lookahead.

Start recovery as soon as the invalid bundle count is detected so the
HIF is reinitialized instead of waiting for the firmware watchdog.
ath10k_core_start_recovery() does nothing when a recovery is already
pending, which would leave the interrupt storm running, so also mask
the target interrupts.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 748ba6749339..fdf19ce4b55b 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -497,6 +497,8 @@ static int ath10k_sdio_mbox_rx_process_packets(struct ath10k *ar,
 	return ret;
 }
 
+static int ath10k_sdio_disable_intrs(struct ath10k *ar);
+
 static int ath10k_sdio_mbox_alloc_bundle(struct ath10k *ar,
 					 struct ath10k_sdio_rx_data *rx_pkts,
 					 struct ath10k_htc_hdr *htc_hdr,
@@ -513,6 +515,11 @@ static int ath10k_sdio_mbox_alloc_bundle(struct ath10k *ar,
 			    "HTC bundle length %u exceeds maximum %u\n",
 			    le16_to_cpu(htc_hdr->len),
 			    max_msgs);
+		ath10k_core_start_recovery(ar);
+		/* Recovery is a no-op if already pending, so also mask the
+		 * target interrupts to stop the IRQ storm.
+		 */
+		ath10k_sdio_disable_intrs(ar);
 		return -ENOMEM;
 	}
 

-- 
2.34.1

