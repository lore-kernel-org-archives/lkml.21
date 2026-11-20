Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164184;
	b=Pbqc5MVw9nhqOGr/9Ml2VYJeh1qeS5+QBy6DMnxR+wiH8cVq3Hmb/Yn97GIYcIcy9de0
	 X83hSMVqercwDs7O4qOPzOSg96WkquI0T2Phjh0+Puq8SICGS7YV5mfR43buoonnXLdvU
	 N+ElVsBzuGrfumLc+uztslUKSsK4N9KncGRsVdsrCuk3Iici2JvFHj9PhuCPCX8mpg7d8
	 Lhg9OciiFNDORJucweWK1qNBW8Gp8eoApLi6vZNOtSsU3ucJBf7STiG0WSix1Suxv0MJq
	 m2TxLEDKKuyfjEhevdbnrlHY0KzIt6QIwHlBSa/LsyBp1n1TrD4kuA+Qd/p1agVZWfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164184;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tNtJdgVbX3slZatS7ZEsC34JpdhhpMQzsODk0CveR/s=;
	b=AAHrFYECdpiGEBw0M1nYJvXt0dK3MsOrFgwwg144OOKLR8Fq26HeT+3zDB5sc0Oe5uzl
	 wgsJ+2C4VcXhpdHyvOOMtP2MH0OMgdNZD5f6cObbhKfoP8733PyVqGGoC6C8rR9S/n9vJ
	 RK1JRQ+QATLbw9Jm9jJ38VAp2pohhzYtOV+QBu8WrprL8DuLXMqvk1mVogXuIBnwiAaIK
	 y+XMULJgjqvm3ePsug9nwDZXDwPAY968+BMnQw0JO6NFQ1oCC83Gr+m87TfNzKV1h3MbC
	 jsSeUWxTZw45yO59QrSnTHtRFGki/t4L/HMvGoyZxfADxaoEOC0xGJTP3JuFgEuZJnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NHX1EORn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gxoeJzSv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946AE60A382F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 946AE60A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NHX1EORn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gxoeJzSv
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eqtp144509
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tNtJdgVbX3slZatS7ZEsC34JpdhhpMQzsODk0CveR/s=; b=NHX1EORnDeB7UJza
	zA78agMW5kBPecBVqSsp69Imv9knGhjE+l05QQMFSYq1toKpFVt7bYCcwGfLqxHJ
	MxfSGKZ2jLdm7o9M7rGGVqPerYYV76itWAy9SXrup7utZ7x0xxpXzUpg4yS2BCgk
	k/jJpse2SMm8kSJLqKYMquD7gjb52QYWYPogcaIQyJmHSNuWqarEH+QJDfQ3rV7X
	09pgNxaOt+DdsJCAIMtCtO5Yn3Lz5sa6P7Wt4KqFAgmVqBrpRKw/nODwAasfW54T
	mx4A6wCs0lN3A7Kfrdr3HLYOq/VRpxe2DDgpNcBKJJGnfnzuHuLA11o3a0Ly11Fg
	/w0wdg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbgunx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:43:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-382af5cfc58so1881504eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164182; x=1795768982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNtJdgVbX3slZatS7ZEsC34JpdhhpMQzsODk0CveR/s=;
        b=gxoeJzSveI+obu+re/wcoZs1G8uVoWtz0te0K792ahWcj9ep/9y1xG1yD6m1urWWRr
         bvjnR2daNyk+ys/J406b4R9ld91UUWXwoFJ9nKqZflc9rCLamSM/fRCp5Pn4wHHXJ/iY
         Y/P0HIfJtR1p54agMzLbFU9LK95u6n39rKbBOKlPwXnHVfexyMDk5Qar0OU0hx7EIx7i
         wO6LB1N1klTbjhzahBXuONPH2iyKs4xHgB1z7la4I+0bjNMBIj3MdDSGf0+4PxXco5OK
         /KEkybAbJ/oRFsz7yJfqqKIRDsNPN9npm40Yv3RBnV8ZfwyMq0nSggfC2Vcid+6ZPLUL
         Zc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164182; x=1795768982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tNtJdgVbX3slZatS7ZEsC34JpdhhpMQzsODk0CveR/s=;
        b=pkQ2z6vrhS9DOy0VI840ZOM9Jmst+wysSTTH0X7LzApD/nBTvltr++OpPd7xAaWYg6
         rvvPt1pZHYFqQ+14LN+on2fpr315u60Wq61bJnxSNypN4u8Gn9wJc59nDwBwWu9IqW5n
         bYaljATxAdNsXxpn+plmOLsKWrD3OL9wXR1arkovDLG3cc7vPhByskf0mpH/ZkiMOOuU
         LcJY/VH1ZF/CU7M1JnuEZQXwCUkXd74t8PiZOmpSzz1mit0WkUnEKLhco5FS9Egro6DZ
         xRvQKScLY3uSdGsGPCORiBK6U4eQtoOfzdOzgTthpAlm4oTta+NrjrVuXcyk/2nICdMt
         IUww==
X-Forwarded-Encrypted: i=1; AL+hErECNhKSFRPzDerUAI9DriJ1gsaBFsBgjZzSAiyilXdAEApbxhwx+8t5ELa/ILTPGQFrV/BXJq9xSB2hM88=@vger.kernel.org
X-Gm-Message-State: APuU4Z/V94kkBb0w1s0iOtWsSEw2G5wOeVP0BECE1fvKGjawBU4ubT34
	+wFOVU2j0PSEdr1zcF1LVVCNClt0bABkeXSLisruxdjYMZR9Qb9zERtW+F4P/HKOlEePfQP+5Dl
	QCzIAKKVovgsdZzUmR16/zY38ldJqohWOkeAyaDBCxzffBhf5vTlsllF0D0NumZyYNi4=
X-Gm-Gg: AZFdTZc5qlNfRflENEhFCkR2Fx/OToI7zaKhD3jyHrpDxn4FzGcFLv4VFmZGl7Suvf3
	fzqy+3Rc7Mykfb0An/1FZM4vJP5a7JNgd9+zXiyVvBsc2zqHqq4jNSoI+mSwvSNif07Lk76lCrn
	Na45aXlII55hjfIhpuYcpd9XalOsr9lqV0JNVdkxvZR0KB3u7lb5kyGXca3vcA6l1vp1MuRb/2v
	0A820xosKoTqamefqGZeeAQMMIzvIFM23CooO1UTFQjM8Y3akRxUE7QPGh+ACo5enlbz++lBCOD
	9MeCxH/hGlq54ORptSVrlAVJGOj8FjpNNQ76qZpc281o6hM0PfDP027NtgM7XjQPHlgCm4Zqkr+
	6eK1D+JL3RVleQaYpRbHkiv+3BCWkWiSvk8J80W3oIB8PXULinfVUnwO9KwcYcvhfVEO1G1uj4j
	62bD2agWdTQIGqQfPNuO4dnFY=
X-Received: by 2002:a05:7300:ce11:b0:381:a037:b060 with SMTP id 5a478bee46e88-3856e63b3dfmr2114197eec.9.1795164182118;
        Fri, 20 Nov 2026 00:43:02 -0800 (PST)
X-Received: by 2002:a05:7300:ce11:b0:381:a037:b060 with SMTP id 5a478bee46e88-3856e63b3dfmr2114176eec.9.1795164181606;
        Fri, 20 Nov 2026 00:43:01 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:43:01 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:34 -0800
Subject: [PATCH ath-next v4 09/10] wifi: ath10k: reject scan requests while
 the device is not running
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
Message-Id: <20261120-recovery-v4-v4-9-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=1791;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=jQsKbkB5iyun7y2BOXmT/QxNJpkL/SdMSLPjVlc9s6k=;
 b=gm8m30oMVR4PS6QT+wGJNAXS5+0xMygQHX+c0M2iRnz8dfDU1d27y8H3tBkmEFkm1SOU5HwKo
 qv58cg4sTXpDBOmutJmCo3JM8CnChohPXMme5NTvcsYa8eICfUeQlfR
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX5ve4uOwFBx8Y
 jndtWls1mhKlwI3zqUvVy09g/yuEbdnLc/rnW4gZsY8tIGCeINEV3GnIfRrdmkYyfQpjBx3Qw8u
 g5gKxuNLqGYoXS/vYXvz++XQuPtMgH3ePbaKKsTEfQ/F6g+UwE60lUql68RB3ydz83Ou2TxENtc
 vXFWRVmpA72i3MDtPVXwuh2UhmJO2V2Cbr/vp0gBA+i0urGLvZYI2qla9ibr10C+lxt4qcQNtRt
 g4rHhQ9yEgXve394LCAkWy4lZ8uAYDrV5FTf5kWuI9qB5rZT+gmxzggfAvVMIjv9VSVJdhsSmO7
 3RXjrYjsDydu0pyJ1h5iaNsKcNe6UgWQP2iY8IbTaBVzWGjSDCxMiz0kRtDv9WjtQ+7mpHLxrLi
 wtWqSyJp0Y5AUzVPSjfn7z45Y2V91+VP60N9vDVWM6Fw8nosswbyjHtyKpyB4SjIx4+HplTxYkf
 OQ8SNe+GI+EDAvOqEnQ==
X-Proofpoint-GUID: ytfIGsFX2ad5BCV_Wvd7v5IXzY9Oo_5p
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b000816 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=bVNB9YUvG8vYEfrUsegA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: ytfIGsFX2ad5BCV_Wvd7v5IXzY9Oo_5p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX1jyLi8fDjJw9
 ABJS1MaLgIo7fm4SKhgAL10GKgnZMLu96oLhJiqHh2yt3D6XffAqWr1p6SnSpxrfOzTZev/Anze
 Xw+LVCFuOdnP97obmi3y81XF8P6dMMI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034

ath10k_core_restart() releases ar->conf_mutex after halting the
device, and ath10k_start() later takes it again while powering the
device back up. ath10k_hw_scan() does not check ar->state, so a scan
request may enter between these operations and be sent while the
device is powered down.

On SDIO, ath10k_wmi_cmd_send_nowait() queues the command on
ar_sdio->wr_async_work and returns success. The queued mailbox write
may then run while ath10k_start() is initializing the chip in BMI
mode, resulting in errors such as:

  failed to stop wmi scan: -108
  failed to start hw scan: -110
  failed to read from address 0x868: -110
  bmi communication timeout
  could not write board data (-110)

The BMI initialization then fails and the driver may enter the
WEDGED state.

Reject scan requests with -EBUSY unless the device is in
ATH10K_STATE_ON or ATH10K_STATE_RESTARTED, matching the state check
already used by __ath10k_set_antenna().

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a213d8c2a8e8..5d3f331950a9 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6415,6 +6415,12 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
 
 	mutex_lock(&ar->conf_mutex);
 
+	if (ar->state != ATH10K_STATE_ON &&
+	    ar->state != ATH10K_STATE_RESTARTED) {
+		ret = -EBUSY;
+		goto exit;
+	}
+
 	if (ath10k_mac_tdls_vif_stations_count(hw, vif) > 0) {
 		ret = -EBUSY;
 		goto exit;

-- 
2.34.1

