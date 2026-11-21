Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302471;
	b=C8fW2liZhTp5xoN8gjaKDGS8xycb/pfHjSqBb2ctBP0UKkM/7X3YZ4kGmR2ALz7vnz66
	 DMhnVfp/9RDsFtKKukimZsTCdzIO8n90LKy5ZUGmHq1XMDOkAvffMQQKlJisic/M5oXFb
	 3Mhv1/Zs+9k+SLKbI1OJjqwUW/JWyBx1HSOvx8PdzueUTqigH18JV8OmzK0pjkSjDr6q9
	 tSk7ESBie6FZUlTKzx2AEuku43QTUhWybFPjpPJu8K9HoQXKj5D5F7jFUKoFtaGN1lcI1
	 /2kvLeBsXM9TX3XSOG1BwMP1NrD1sGmwVaT4ihNeWsLhTUPdiAJmZ6At/uu0LX6FciA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JnwF+oS5w2IlCzPszI1C/3O+0i/sc/fD9zkOECKdkbE=;
	b=3b7P/06xQyVRen2vuseH6rg/eSxWDlz+RZzUVySgr9n27UQdZ+ZeTDREaSu/PiPL1ibR
	 QOUhd4rxWZPtHtwJrwvrgh27miZSs4IqxC5NKMi6xkXp/w5a3ATT5L0ohIpoqwtE49M8/
	 2R6AVT0bK9Z9SOVoL699cOpRHtjAskAOfo8lVWiDjbOMphofwmR7jXSfpUilZQT6t/Sob
	 icsQTwWNEJNG6Zs44g5RXcS1YlnZba+Zafz3lPxQ678dbgl/l3lvq3f477aUBPT5zdnmF
	 tI67XDUbaNaBhdAN5XSTQCMcFjbYpUPGj+7VJbhHwbgjMqejJX+Nx+YitSlU0iXvTlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=i+meoJfj;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7AE606A684
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F7AE606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=i+meoJfj
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c51373ae637so323925266b.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302469; x=1795907269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JnwF+oS5w2IlCzPszI1C/3O+0i/sc/fD9zkOECKdkbE=;
        b=i+meoJfjw67kG37zzbxyTSd6hvDpHY019EfJMc48D6DqYE5B6ujS0xSXpt0jKLw3hP
         AKp3vn9hFue7ICWpJfQufVTGM4ZYqoZFQmLCm0P/futHFDImBFjt8NwjuckZsSyvt4SC
         HXoBaGB2ZO6xwUi8BLFefY0tDSnFHLqIf4ws+diAGqR+Cme1X6u3lPxHo9gMvlsI3wxQ
         1Fjy5H4Yjv0RTaPY5AYCLh2BvppVsluWlqcL+ZycsdWDgmzpHHhPt3ojlc5+6MYyFJMe
         QG+KnutGYDPAod6wXfEOw4YaYyXjeT86VTd4P153WntU8rUOge1v/KC2iXOMHsRnbr40
         0b3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302469; x=1795907269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JnwF+oS5w2IlCzPszI1C/3O+0i/sc/fD9zkOECKdkbE=;
        b=hnh4zEzw1eLNYxMR8s9WMsiMaIyTY0F/pF9bJ53sYqptYbFRHaDSTbgiJeqqCf/LYB
         +YvyfITiBN58q7WtywepVo75EaXO3xnmGrZUdt08ZnA9Zh0C8z5MmmzGnEXo9LbWAebN
         gHKLGvn647o8uLQ5Na0KqB0xPE0s9qQ2Xycf28RE2JMo1b9V0qZh6dy7Mxs5k/3d8LEF
         6QuUZI4dXOJZ0HNIodOqM4oDPDJZXE5S7gyxOtoj7uKO0wE4bChvfaEQFhKhQG0sKSH/
         stV60NamSeNYm0ZAtjc9vJR1EL877qunerfR7shQcy9Jg9NQobk42XYPBW6HN97eGP/U
         zCZw==
X-Forwarded-Encrypted: i=1; AL+hErHPpVHQdFjSxIxtXp6HGsqPM+AC1QRCNzjvGml3sxccyRmrKgg/TpPSRYO5kDNrg4L1X2WFbcwJTlRYY/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tu3ctgggn0pa6d/5i73TexavtzwYKszOwgcPaKOM1fMs2gAVk
	UqCpfWG+t+CLA5LtNogJ+K2KiJPIG5Yxxycgvr7cJqoG9Uf6J1FfEHGJ3iNqsVBu7g==
X-Gm-Gg: AZFdTZfs8mALRhs3o7WMAc/gmGARmD8WrfjxGXZqG0BcvQP6nOfoI+siqeOGaVeN7ww
	RwtImbkjx3hwAvhEMs+4OEAYKxOzK/fa+OOe5wONvLNClyPsMbFxDUJQpmAeiBrj1WUThfLKPgl
	Qm5RiR6nvIaDePHVBuatWoaf/M5gt3Hz5zcTVaRQbIFCPg/6KmgmoZpvrCc9ArbO77JotXILmhi
	c0LjF9Wlz7JPMXjOZOsWSQ+G3ASvleEz9Xx88YutLl//EOOOw2xfg9qIxiKAyKJAoi/mFsandZv
	L3kzNpdzNcuIURp+3I8J4Ymkf/TflEOfghRCqVE3DxFdUGN6ecmd9SO0VoycLa4DtgPbKLBkKeu
	l91bHtVWFGEm82Xa3GlOvfHM+nVaOAPGXLHQ+qFeSraewrvvPxhrbPWatmE+yg4nAweSI+JXWze
	fuTSy/J9H40neVVJRoV3H0TkqC+voW+A3CTHGlEjRJn13HvJBEoclDgZl0ga8P+2u5RTau+ia3c
	oUSnVWol3HaRlj+PG57KSr6Rb66TBVaUHRtDeLw2+xXkupaTPW7bemeK2TSF872h/CibOgSqaSL
	znxcgsZGVc9nEyblNbJnnWEKrp8d9TA4c+pDB0bEyqTpy6h2cALco50+SR+SXqa/eDAioLnn0Fx
	GH+567HTzcIUynP8/3bGnOAexHfO9aJgF18SykRQp9WckyE9yzJ0TN3w8oTreRoqO8J/AY+1JlX
	u3dMHLdDDu3fUR4fdMWwpbtFor90x63LudycZr7ifKL9839ZV1EpSIw0aWZxTV9qtTVPOSInYe2
	a5djn3G/6S3WWyAwZPvvzfnBPGoXUSNnsAl6eBN8Gg26TT/iSedmY+x7t4tMqmDG1+Bf7N7qNEA
	czShGcwGeYR4vsEoBCYiWIyIbfJArPNrAlV964QRyJJXNZHn56nSNbtP6PfdFOT8KF0uUZ2N1zs
	=
X-Received: by 2002:a17:906:115a:b0:c1f:983f:d8a with SMTP id a640c23a62f3a-c513a89ec1emr503984666b.24.1795302469619;
        Sat, 21 Nov 2026 15:07:49 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:48 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	Jiale Yao <yaojiale02@163.com>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH ath-next v3 09/13] wifi: ath11k: release the QMI handle when the QMI service init fails
Date: Sun, 22 Nov 2026 00:07:27 +0100
Message-ID: <20261121230731.1206043-10-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ath11k_qmi_init_service() returns an error without releasing the QMI
handle it initialised when alloc_ordered_workqueue() or qmi_add_lookup()
fails. Its caller ath11k_core_soc_create() does not call
ath11k_qmi_deinit_service() in that case, so the handle's socket,
workqueue and receive buffer are leaked.

Release the handle on both error paths.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new.

 drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index aee32aec8732..3ce7c4e5c51c 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3334,7 +3334,8 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 	ab->qmi.event_wq = alloc_ordered_workqueue("ath11k_qmi_driver_event", 0);
 	if (!ab->qmi.event_wq) {
 		ath11k_err(ab, "failed to allocate workqueue\n");
-		return -EFAULT;
+		ret = -EFAULT;
+		goto err_release_handle;
 	}
 
 	INIT_LIST_HEAD(&ab->qmi.event_list);
@@ -3347,9 +3348,14 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 	if (ret < 0) {
 		ath11k_warn(ab, "failed to add qmi lookup: %d\n", ret);
 		destroy_workqueue(ab->qmi.event_wq);
-		return ret;
+		goto err_release_handle;
 	}
 
+	return ret;
+
+err_release_handle:
+	qmi_handle_release(&ab->qmi.handle);
+
 	return ret;
 }
 
-- 
2.53.0

