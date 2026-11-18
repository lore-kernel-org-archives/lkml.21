Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794979288;
	b=tQsaUh6Fw3bHDLb/B8kxISp8SDSFOaavZ1SulDkkJSAUuGOGFGDGvL1HDWAHLAmvJBRJ
	 MqmcFfHLoiZaIvT6uj3watPKrEaOWOAe+JEpXai2LLmw739dL4r0/RAwsXW+T3mA2O9Zf
	 HWzuTm686pKj+V8Zqs/eCMRkZq/LyLUH7ZiBEg1linBZxV7iqLxvc4NN/E6IXgnqYYllP
	 KG5xbVBuaU1tySHhVhuB1ktOYM+k/zU7FYQhLooIuZbs8C5cRRMPDLptrWO7uxkuoFC7q
	 AorCT2F/37qSK9KBeESt6+XxMmSZrmxq2DH+FGo4q/h7rKIyvcguyjf/nuB+c+jF5iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794979288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cPHizIyryNLitu0wSeuSX7cXAqui8133TRyCoJfvIRk=;
	b=x7AhcBA9r0MAU97mE3z8xS/N/ehCFMGrYev8q5kn7G82HM8hgjNn7VrW1y9rd/k98CD6
	 5PwR1OFhXP22sNCksJcVVm3sRNzDpCy2XVsTrYGo2PXVYZ+kEAFQKHc3kM6Ip387RgWQJ
	 HKX7U5ia+4SUpz/PoaweMrTC6Jp3/F651sYGtB+GlH4o6+BMqNNAw927pMh7ABjw1+5i7
	 u04esGgBmDVBTKUGtvA1eyTung9ylL+9M2+UWdesnu1p2pS8G3yZ0bLS0JicV4UM88iVo
	 q/ezPwL2SYMRia6PBBC0B0KN2rPj61RCjhDayPujg8YXn4RoVKPUTCuaozQxTp4IPDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wdr7GsFV;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F541606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F541606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wdr7GsFV
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93f1e5d7450so59237085a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794979286; x=1795584086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cPHizIyryNLitu0wSeuSX7cXAqui8133TRyCoJfvIRk=;
        b=Wdr7GsFVFyPw1YW48GX/9VGp+rzxLiG8QI59PmBRBepuKn7sryXfTEUwGVEi9driat
         ZMlbSeqecaUyiLWzyYdD1Z9jbRJHrpWfLZJr97yy7+O0CgDDNwmCSYYa5PCR8PXvt/QE
         6nA3LHK6F6QAGm7SvWLwN7uEJ6UyhLdYe386Cy9fxh2KAoXCQCsSw9ElurZsMfY4H2LJ
         BleWFFkf+u415vFs1kwsAaShWwYhd4SOOgfxnYltHscMv8KqFFKqRGDJHpvkoCFa6xZd
         1xeC4p0PYyc9WAGAfu73M1squLzij0Uu14AXnXkoR4gSB4c6rb+OBoMXPFn7SVEtKkF5
         TjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794979286; x=1795584086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPHizIyryNLitu0wSeuSX7cXAqui8133TRyCoJfvIRk=;
        b=NuOmQqcVffoPlZKZTYn9PV1RCCovH8iEfdUprrUGxIUis+t+gRNhg+chal8SaYS0MH
         BNVZLGNcNKlg8zvRXxPJcuJ0njrSFGBZo1LIDFo772dm4G4W6NvzsaLh18tW5iNk60Nl
         37MdZwTBDOEWcDqzih1zxMZHFI1OHSLAoqQT/ulBAaj+yAYiQsShwNMzrzcyL7WAZnkH
         xTe6okN4tbmRYR4ZGjX+M8RoLGPyaWd0X+aVtSyh2RFOBMNZypEgv+DaYG9wvDNu48g7
         06wbSAJSS6qFwmJMGSiG1aMq5K5RuXpKbwirdSmja9N9h0+PAdPhILH48+UEZ7iT9ZSM
         RGhA==
X-Forwarded-Encrypted: i=1; AL+hErGfI6jKyeseou8d5ajBdiGNPpIPay+Ys72tAS6vX7+WLeyVNfYIug41IBx75vRUOGWse+haBgEwRqWXw14=@vger.kernel.org
X-Gm-Message-State: APuU4Z+R2j/EmA1q0H1R2MabMZq5wB2mi04CQuaDHadfQETlhvXkl1c1
	ga9i7zuT2FU77ynTap7UFOFTVleLnQS7TxR+cnMyX5oy2jPhkhcBlIjA
X-Gm-Gg: AYBFou2tF33DgeSiaAEf7HScMbWEHzUp7RL0kiGLH+Dd6b0VVf/1h4EG0OAJ9Napc8M
	3LfJ9n19r6CSV2444yNq+a1s8I3nuZ57g9cePCmi+DOiJnGm3msq4Cg2ou5pOIlPjwPO2WHajmC
	KoONZIePbYQ532CJN/kyZGa4JRKi2lFGhEbOt1fk0RDDJ7kGcG5o0HrKDYturv6OgnfX/3WyE6s
	bBKcQMtO1Rh1gd1PtFhZxHxBnJjuBEUhyuvAPbzEozR3ID/+tZxn32jL0ynPtwm82iiOSu1qrjA
	4W3r9flm2n1AMNik+weXXzWqampZDaMgIJh3T1FdsxLeMDxTOLQObR49CU6NGc/FBsWRxqVGw0J
	T+WZ8R3zFPXybHz3twOKw98D3xAhs6Jkw0PPrcpEMTlF8orh/14c3JwVE0ajCgUL6XoaG/UPtAb
	QhsIH8yRjAE8G6dnn8SNMxDDFDJ8NqsHC6BYUKqeH4hZyb+Y+5BAtHWUX0pGoupQUPokDLRweId
	zuON8f45Yz+pRU0pwOW8LM4udNFqHe0lxzV9i6uLL9F6/JapQ/gucr+Fh6qlsFDQeyc09pg3v+S
	aAOktEE5ijDPFPIgXKUm3MsmSzVZVBljczai/G4DZDmbl+fGrwwXm9aBVSofiMWAOp4Pn9auj5E
	=
X-Received: by 2002:a05:620a:8710:20b0:949:99e1:42d7 with SMTP id af79cd13be357-94999e14369mr199935885a.73.1794979286447;
        Tue, 17 Nov 2026 21:21:26 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d9b579sm12305296d6.38.2026.11.17.21.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:21:26 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH ath-next] wifi: ath10k: free msdu_id and skb reference when HL TX fails
Date: Wed, 18 Nov 2026 00:21:16 -0500
Message-ID: <20261118052116.3901761-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

For SDIO and USB devices, ath10k_htt_tx_hl() allocates an msdu_id in
htt->pending_tx and takes an extra skb reference that
ath10k_htt_htc_tx_complete() normally drops. If ath10k_htc_send_hl()
fails, for example because the endpoint has no TX credits and TX
bundling is off, no completion runs and both are leaked. After
max_num_pending_tx such failures, msdu_id allocation fails and no more
data frames can be sent.

Free the msdu_id under tx_lock, as ath10k_htt_tx_32() does on its error
path, and drop the extra skb reference.

Fixes: 8ea51e409eb0 ("ath10k: htt: support MSDU ids with SDIO")
Fixes: 30382dd1cf3a ("ath10k: fix use-after-free on SDIO data frames")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus ATH10K_SDIO, ATH10K_USB
and W=1.

 drivers/net/wireless/ath/ath10k/htt_tx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index efaea150025b..b437b09717e1 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1378,6 +1378,14 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 	tx_desc->peerid = __cpu_to_le32(HTT_INVALID_PEERID);
 
 	res = ath10k_htc_send_hl(&htt->ar->htc, htt->eid, msdu);
+	if (res) {
+		if (ar->bus_param.hl_msdu_ids) {
+			spin_lock_bh(&htt->tx_lock);
+			ath10k_htt_tx_free_msdu_id(htt, msdu_id);
+			spin_unlock_bh(&htt->tx_lock);
+		}
+		dev_kfree_skb_any(msdu);
+	}
 
 out:
 	return res;

base-commit: 4016f6c3149e7e3faccc1654db6a3030c069383a
-- 
2.43.0

