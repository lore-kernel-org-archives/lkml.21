Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164185;
	b=ziovFBohA4cQotnK4L4EytYaNVJrzFkUZPTXnU4p0D68LDdvHpEeYIwUbS3VbGmf260G
	 0n7S6A8nFjGXMZbWo+NP4ZiFd32KlbY/2PZV/h2Md1iRsxeB2CvtjCydCvK0EmHXJ1mPC
	 78jLXsZxUVkjEKc+Q/SsH3/B0i4EXx375gjLMZm1e3tErXdgwYLi3+G+11/2A5dK1ePUd
	 7hXGAQ9c/NwZLhM9JMxC6GgU2Qm2h/p/+S1k7Jss3vggZF8VjjKNAVozS4b+lAu8S3A5z
	 xdvbVAA66pY2LepUOfIIOsiciFcbdEUI+EzZilCmutbu7bbKGBn2WDhZxmYoH8hT9oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164185;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bk74ZT+MJ+JGKowULWayQu2LJp4VvyfuIMp2TvysVmg=;
	b=lVtZCicoq+QPc2gmAMwzVjyg96KKAFMCmSmIEl/8b3ylylh2NY1V7dMrmPvWRR7XEOGw
	 JD3ITWa0paxyIrgu+m09yv1D2CUWV9DLMJaUIDZg0mz0BV8YYUpFCCAYCC9u2tHex0/UE
	 ftr6HBNn0jcVTBiV2M81Yz1nk0p9cbXRVp+OhoofIDELZZMNFa1gyu8rogySYP0BGyjnC
	 LLN0TyDMUnyz+QJ7n1BEER/j9YzibNGf6qzUq4fZ8iTnAoBg5mVSZ8uXHOckLCSmQrP+s
	 hcOaFakukNAtcmJ56Q4AQ650bCjnqps7qKkBVu7A6JPMUUbl+Zcp6rm6QumJG/reSkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ue88hfMy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I3CVA0Hx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971D660A5BC5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 971D660A5BC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ue88hfMy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I3CVA0Hx
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eq1q144492
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bk74ZT+MJ+JGKowULWayQu2LJp4VvyfuIMp2TvysVmg=; b=Ue88hfMyeyknN/Na
	PMcVAuY6z/eVD7hdpBhtiSFXvWLmepbDDK+2kluueZs0ldsuAjGKKgajgMcAPnN5
	3GGCg6zrsh5VtnNUkzyyRIvg/w7Amzf8lc88YURAHkAcaALBqasggJHJRE43FbnI
	aCThIZHTcmUaCgFICApibpQ9UbUh8BLGTdrzaRwoBict1bPlD6H1iggg72y62N2W
	f2qdpEjeAbvqPD6IazEjLZG22RjKyJ88fMk9N+5oqFacHd4/57oXw2SDB5oocdlp
	9lqH2y3j9DbklWN23u7WEqXW4eOqlCEG9d4ybGISgSaxfLSAznabbJDBMX5cwLMj
	CFrPqw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbguny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:43:03 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383165e9b0fso707487eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164183; x=1795768983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bk74ZT+MJ+JGKowULWayQu2LJp4VvyfuIMp2TvysVmg=;
        b=I3CVA0HxGwLqEj2qUvidHrobjDWkjLSAXHXdFIzOqh+kffUFcN4bVSPaHC2o3mjGKN
         /CTjKCOUXGfO12M4Hi89+8ilu/GGIepnFM4fY0X5G4ltVFw3b/Yv4qdyTL1klTwsMFcI
         FsJI0Cs0qypAzWxufv+oHI2c555d2erFIaw5GMoOAJWc0t5hb+AaGL9oRND9LCp5H+UV
         tM9SibNlY3nRjpjraVNSB8YBKrRsEuWwICifmjosREX+imGfqRhotUmpYw+WCDDnMhNl
         VG2nge8nsXMIl3WkBwYZOyk8rk+TacKh7qiAplif5de90hhFKlPYaNfRs//gg+49oRZY
         fIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164183; x=1795768983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bk74ZT+MJ+JGKowULWayQu2LJp4VvyfuIMp2TvysVmg=;
        b=Y28dN7T1aTn4cSHzZzZZVGBJEFiUTiPqUnP9P22Qn/BdUAclPp/dT+2tOG4rc5nyLq
         cJIfnCNVEFRv+va62rCpCfV2/md9o1b7I3mHvBTKVRgXrx2/Oc/zxDjDgU8d2QAFCR7Q
         5/oarZXjgE4kpDv0ooR7lmrrQM66gDjM169mOJJPOfQy4MrAhkNuc3fLV2T+2wdzP2yP
         +hcQ9f82+vwIsauqKLfASAXPgtiO+DAkplEzYNrr5ZfTgUqOx2DzYj43luVzEPxiMIwT
         JT050KF2unxq9peD773L/ov4Q73WXFCxnrQM96nlh+TLbfMWo3zjO90R4BjHpvCdm3qe
         roPw==
X-Forwarded-Encrypted: i=1; AL+hErGsnoY1fzNCDzcvcLO2WQZSC94MCwtcHOM+GiMI0mNJUn3XhqyrsvW2+GO/7FyUNpC61UPYokQtc13e7Rw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aUDCxUptRx9/WilJ5Y+Mco7ThvJQVrmXOrqyleKalcjyf/Fkp
	GarwpVJ7TBOH8D5IdlmYEcUo22gRLE3P+3t/GPwW1i/r6foiGisFr+hsvrGO946okPUEZyHFppn
	+7zJ6YlWujf5LlabbxXiMpFnqbvGmAb3DcDFjW05KBS4ADBRVtr8Z31FluHmU1L8PayE=
X-Gm-Gg: AZFdTZdlkK8xkKhqDZ2p7VhSe7o61WRbVgYM3O3/6pwdzqk+nmVxiXMQEt4YcocsvzZ
	Xi5+wxOkO0TtDE4PPwDtgSPglQc7+JMHvypZW3WIKd2J9iMG8xkrHuEIAzWcJd2wPGfRNp+tEe3
	poCghXt4VNABv6LiAdGdw4A2SBahQ0O/QjCzBxmsES96MS3Kc7B5gyfOQJIqf/NzW2D5p9iyfU0
	pHf2mFn456iETYz4vjClwBqJpgJeEunSTLrXucV2zDwr5czf4iCXV6JXIlwJeBgHVfs+w2Qt+hc
	zMiKg9BY4Wnc3458D84avUOH813NKRAB1BBBgnuu9Ptaq6FZTtfGUA/EEafyEhDo0bA0PG96R9H
	MM7cF/owdgF0/+iBwHXPClx4jwLpVQmHILxd1hoUbVBd/cU7XKfUgznvxhSNyYnnNOlRXkFnC5o
	nOw46NrTrAgh8TbHYfJo3ZnhU=
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr2356577eec.14.1795164183273;
        Fri, 20 Nov 2026 00:43:03 -0800 (PST)
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr2356546eec.14.1795164182667;
        Fri, 20 Nov 2026 00:43:02 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:43:02 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:35 -0800
Subject: [PATCH ath-next v4 10/10] wifi: ath10k: drop async writes and
 sleep timer across power cycles
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
Message-Id: <20261120-recovery-v4-v4-10-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=6759;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=z8KYkGdqkhnSqr83Tg566e7vp6z6Rom1upSnLJcwUrM=;
 b=gRtoor9TRTWzrmnfB+uBtwKOMsYIpI2xFukls4ziPH6sEoB1Cyv/Kv7iUvqOJ55edvYom3YHg
 57/Zei/6pebAGLqX5ZFa7jcPsdfxRT9g1DRfIzCNH6PkeL4IC3bK9nL
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX8s+cOONrllt0
 7XG6jeT1fyo96/8Q1of7FKzV28HlZD3pt6XxaCOH8kYgYJGd7Xch+tV06MKUttf0xDC8EPGX7+9
 5+qbnMmQl4wM0aVFPvVZI053BBttjjpRIpmBwj2DhcF2OR89gEfedLM+Ovp3seTZfVbU4koGEc7
 ylbvyjHKXcpdSlWo6Ox46lMbcWz57swTHKWps/VVSUuqlJvV1Dswufri40ox00ukyj/fX+U+rgk
 FdqnVYLA3wQOtwYWA5B9nYa6C4hoPp89F6s0XuXYwSmJfPxSqcF4WFYs5M/TBpkl+bvFrOhrpBy
 SVgsmtWLe9nf+hcc/iKiGcpNZD6dr5dfk/R2DBMjGRKZO1GlzfcaR+/Bjgrz0B87ZIBVzvZ0KI2
 j0aUbaX85+QT5+bEqeWFJotfhsVSr/AKsTaZIFjsjKSPH7fgzRAj5CyD8TWrzJjt0lwnis696YR
 sMYW3Gav55SEY0gj/DA==
X-Proofpoint-GUID: hlHTTJCcJTpjfiSYNF5RkH50pPgVzegI
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b000818 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=fr4EAzCGZu4FAUfOKUQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: hlHTTJCcJTpjfiSYNF5RkH50pPgVzegI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfXyTOLT+QrdpOM
 NuCl9OFz3FIdNZSsiAxxZ6odOFUHPXyIYohpGmuLgY2eYm2syZAKAyCgyVM1WrsvsNyVp0FXXQK
 AHNvVqfSibyI8CGIpFsKYncr4WOc2hU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034

ath10k_sdio_hif_tx_sg() queues writes on ar_sdio->wr_asyncq and
schedules wr_async_work. The SDIO sleep timer also schedules this
work, and the work may re-arm the timer.

The current shutdown sequence does not prevent this activity from
surviving an SDIO power cycle:

  - ath10k_sdio_hif_stop() drains wr_asyncq once, but new writes may
    still be queued before the card is marked disabled.

  - ath10k_sdio_hif_power_down() deletes the sleep timer but does not
    cancel wr_async_work.

  - ath10k_sdio_hif_power_up() does not clear work or requests left
    from the previous power cycle.

As a result, stale work may access the SDIO bus while the device is
being reinitialized in BMI mode, causing errors such as:

      failed to read from address 0x868: -110
      failed to read fifo/chip control register: -110
      bmi communication timeout
      could not write board data (-110)

Mark the card disabled before power-down begins so new asynchronous
transfers are rejected. Make wr_async_work drop requests that raced
with the state change instead of accessing the bus.

Synchronize the sleep timer and wr_async_work, then drain wr_asyncq
during both power-down and power-up so no request from an earlier
power cycle can run during BMI initialization. Factor the queue
cleanup into a helper shared with ath10k_sdio_hif_stop().

A dropped request is completed the same way as a written one, only
without the bus access. HTC messages go through
ath10k_htc_notify_tx_completion(), which lets the endpoint release the
skb. The IRQ disable request signals its completion and leaves the skb
to the waiter, which frees it. Every bus request is returned to the
free pool, so nothing is leaked.

As a result, ath10k_sdio_hif_stop() no longer frees the skb of a
non-HTC request itself. The IRQ disable request is the only such
request, and its skb is owned by its waiter.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 78 ++++++++++++++++++++++++----------
 1 file changed, 56 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index fdf19ce4b55b..f0e1feacb629 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1461,6 +1461,33 @@ static void ath10k_sdio_sleep_timer_handler(struct timer_list *t)
 	queue_work(ar_sdio->workqueue, &ar_sdio->wr_async_work);
 }
 
+/* Drop any requests still queued on wr_asyncq without touching the bus.
+ * Caller must ensure wr_async_work is not running concurrently.
+ */
+static void ath10k_sdio_drop_wr_async_reqs(struct ath10k *ar)
+{
+	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
+	struct ath10k_sdio_bus_request *req, *tmp_req;
+
+	spin_lock_bh(&ar_sdio->wr_async_lock);
+
+	list_for_each_entry_safe(req, tmp_req, &ar_sdio->wr_asyncq, list) {
+		struct ath10k_htc_ep *ep;
+
+		list_del(&req->list);
+
+		if (req->htc_msg) {
+			ep = &ar->htc.endpoint[req->eid];
+			ath10k_htc_notify_tx_completion(ep, req->skb);
+		} else if (req->comp) {
+			complete(req->comp);
+		}
+		ath10k_sdio_free_bus_req(ar, req);
+	}
+
+	spin_unlock_bh(&ar_sdio->wr_async_lock);
+}
+
 static void ath10k_sdio_write_async_work(struct work_struct *work)
 {
 	struct ath10k_sdio *ar_sdio = container_of(work, struct ath10k_sdio,
@@ -1469,6 +1496,15 @@ static void ath10k_sdio_write_async_work(struct work_struct *work)
 	struct ath10k_sdio_bus_request *req, *tmp_req;
 	struct ath10k_mbox_info *mbox_info = &ar_sdio->mbox_info;
 
+	/* The card is powered down; drop pending requests instead of
+	 * touching the bus. Prevents stale writes from racing with a
+	 * concurrent BMI power-up on the next recovery cycle.
+	 */
+	if (ar_sdio->is_disabled) {
+		ath10k_sdio_drop_wr_async_reqs(ar);
+		return;
+	}
+
 	spin_lock_bh(&ar_sdio->wr_async_lock);
 
 	list_for_each_entry_safe(req, tmp_req, &ar_sdio->wr_asyncq, list) {
@@ -1586,6 +1622,13 @@ static int ath10k_sdio_hif_power_up(struct ath10k *ar,
 	if (!ar_sdio->is_disabled)
 		return 0;
 
+	/* Flush any sleep timer or async work left over from the previous
+	 * cycle so they cannot fire during BMI and poke the bus.
+	 */
+	timer_delete_sync(&ar_sdio->sleep_timer);
+	cancel_work_sync(&ar_sdio->wr_async_work);
+	ath10k_sdio_drop_wr_async_reqs(ar);
+
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "sdio power on\n");
 
 	ret = ath10k_sdio_config(ar);
@@ -1629,7 +1672,16 @@ static void ath10k_sdio_hif_power_down(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "sdio power off\n");
 
+	/* Reject new async writes from ath10k_sdio_hif_tx_sg() and make
+	 * ath10k_sdio_write_async_work() drop any already-queued
+	 * requests before they touch the bus.
+	 */
+	ar_sdio->is_disabled = true;
+
 	timer_delete_sync(&ar_sdio->sleep_timer);
+	cancel_work_sync(&ar_sdio->wr_async_work);
+	ath10k_sdio_drop_wr_async_reqs(ar);
+
 	ath10k_sdio_set_mbox_sleep(ar, true);
 
 	/* Disable the card */
@@ -1647,8 +1699,6 @@ static void ath10k_sdio_hif_power_down(struct ath10k *ar)
 		ath10k_warn(ar, "unable to reset sdio: %d\n", ret);
 
 	sdio_release_host(ar_sdio->func);
-
-	ar_sdio->is_disabled = true;
 }
 
 static int ath10k_sdio_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
@@ -1659,6 +1709,9 @@ static int ath10k_sdio_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
 	struct sk_buff *skb;
 	int ret, i;
 
+	if (ar_sdio->is_disabled)
+		return -ESHUTDOWN;
+
 	eid = pipe_id_to_eid(pipe_id);
 
 	for (i = 0; i < n_items; i++) {
@@ -1972,7 +2025,6 @@ static void ath10k_sdio_irq_disable(struct ath10k *ar)
 
 static void ath10k_sdio_hif_stop(struct ath10k *ar)
 {
-	struct ath10k_sdio_bus_request *req, *tmp_req;
 	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
 	struct sk_buff *skb;
 
@@ -1984,25 +2036,7 @@ static void ath10k_sdio_hif_stop(struct ath10k *ar)
 		dev_kfree_skb_any(skb);
 
 	cancel_work_sync(&ar_sdio->wr_async_work);
-
-	spin_lock_bh(&ar_sdio->wr_async_lock);
-
-	/* Free all bus requests that have not been handled */
-	list_for_each_entry_safe(req, tmp_req, &ar_sdio->wr_asyncq, list) {
-		struct ath10k_htc_ep *ep;
-
-		list_del(&req->list);
-
-		if (req->htc_msg) {
-			ep = &ar->htc.endpoint[req->eid];
-			ath10k_htc_notify_tx_completion(ep, req->skb);
-		} else if (req->skb) {
-			kfree_skb(req->skb);
-		}
-		ath10k_sdio_free_bus_req(ar, req);
-	}
-
-	spin_unlock_bh(&ar_sdio->wr_async_lock);
+	ath10k_sdio_drop_wr_async_reqs(ar);
 
 	ath10k_core_napi_sync_disable(ar);
 }

-- 
2.34.1

