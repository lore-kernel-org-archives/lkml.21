Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215594;
	b=IqTSnmrZX1/SDHd/tyU1UjD+3m3vbwCgOlwsoxj45flTsQKOmedyeIbJQ4WCDLFvX4Pf
	 DvfOfsioJLKXI4S6tcKZI3G8Nowq8BZUND+arDtBSqmIY/drUFyJj876awB3P+Js/W64y
	 j1JfmTRb/QZQfFI0uNyOT0R86VfCsO4MwXjwiYADBp8iPbiRxPRv5E5+1P9RfjY2NUHdM
	 p7ywYu57MvpnhHBz44jUWzo1d2jML/wfIETqzkEsPcDAuM3TOh1KeEDUUsWsfsIU/Al4k
	 81SU4SQwR1fLHcIvuF3cs3e3RMDonOkaKA/08YswqLGMShcH73D5IwmUyQsuskP5dYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=SVSQbGh8zYpL/nm46MbvuON7rY9JKSGB3zTi9I6pqNg=;
	b=Rv4KAhiB2fPRUfhOJijADNmPZWj1fr+Ga001hhdzGcR9V+FSe+zMVIqnFT5kRc1u1ONk
	 oWpTcnfsQ/z0jH2OOFlLmyXO3rE5odTjLQff3Puc4Hfjoh5mwF0k1Yg57ETwXZR5nFLDt
	 LdIUVZX6ULJxRP3cdC6unmy4PFRBi5XDXgeXrT+zppuJf6i+8y5KGrxwQXa3+vbr3XVB2
	 LoNqbb8ZV/qA5KFXX7TZiUdYogKHXrt4JdaR4CIlJdufhb7/V53MqKlIv3Tp8KngX8YHK
	 dGo1E0DQ58jpCF0HIYYtUdpA1bfaW/YE32i98FXGQxlL6F8g19fgV05fDcRffUciO1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDDwoLwM;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DF1606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9DF1606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDDwoLwM
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so9075295e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795215583; x=1795820383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SVSQbGh8zYpL/nm46MbvuON7rY9JKSGB3zTi9I6pqNg=;
        b=IDDwoLwM+AcdFg5sxUKH41H46H4Hrx2xTaUMauB/92+3oqndlAdNyVy9t5GwuvMglb
         b3HC/oIB0sejpbWCH4y7db7Gz3mZmcoxvVZ/j0/72IVl/h3eeSZxIFE206s9ISURrZ7j
         sFtSUsFNwkdUUe9I2k/efF9/7x/cAuzCkOGrgFutCYXSizqDerT7JVVcUKicCZJqplq9
         XTu/glDvJg2p9abIvQDL4MS5xkBd5GM7/N2OGARPNyk1V1rozu7ScFmSPfyXCkpGsIdu
         EEliXWfo4ZgGRALY0m/LovSoUTI1YQCXqyi/yPJgk0Y8YPsH0pfspyQT1XpWvH+5EmgR
         4RZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795215583; x=1795820383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SVSQbGh8zYpL/nm46MbvuON7rY9JKSGB3zTi9I6pqNg=;
        b=h/014JJzge5gbK11PxFWcb7s98+Uuxn6jRjIRe/dLVSP/WoTrAOJjcz8WD1tq5cDAB
         4RU0iqkjDjckrQuQdmzWiP6TeLCE0PeGbX6Y9middigyJ3OmlOFsxi5OX5ROs3Ai5m8i
         v/ltqH5TJUrHf37HrnCTmPiU6Kd1En/hAOFGRg90XozlBHAPP4SumHvansmrxzjQXI33
         o/6d+VFJRhcv/48mwDH33lBEHHxWZvrdNXLn7Z0eQ3I19W8NprQbC7TekIrsVrjTA31V
         OVw+vFt8NWRA3cEGZ3SjRlhPbuhUkpkDIzaJ3HoIUu+a8LKH0nWOQ5Dk7zGlUCU7BZcU
         3fIQ==
X-Forwarded-Encrypted: i=1; AL+hErEsZzR4d/UfZVpbpMupReij2W42ZpXAyiUsU94TD17oM51TLaENhP8hOhnrjyOgC7CDbEYB/01/bSNav54=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ejh1GTkuCqfNoifqpb/6nI/X8L2NoeE8go8BrZK/RuCvh1R76
	6Ou1mROf233yI7shF+1ZTZRgNP9pOPsv7EvjcP5WzC5DgHv1Enjmgzg=
X-Gm-Gg: AYBFou10NTQarwHWfUeXSqD2IWxdRbGTZkpbzMtm5gM1g7TisqTBClOxTHLw4k7bf+D
	SJS6pRc+7+mQLt9ezTeqqZVi5HCm3knckIKMJBGmD5DuOUaQtOeTK4ZH0iHwmTUpc8ncwUnkMzM
	T0OpvOg+opDolRGrVNVMbIN8Mfq5aBKL8k05Dn86lCSYtTMWewNA7i325vrDF1KAb2hR0jx47hF
	6d8APnfblUFbK/Rvhor5G6I1M3M84ERxwseamPsCCFT1wYg7B16/8RqFE1DaqWJGULUul9KbC6Q
	7QBGh4z3GfXr/jyGk9q3JHVWrCjirOEV25lXUJKVq2vZNoumjR2MJb/qXY1mqG0fB/mWURo4rW6
	jKCDSmwuQlpLgtbjBj4+OlCrcG0K9OU09zqBCMmKVMx7A3/UpVQDrJnt0Zps0Gcoi0yYXQQTfcS
	gEd9ZsCEmNYK+R8oYkGk+wl+TX3oNx4f/lY4tzI5L4wc3WmNI0M4b3C92CdUXDxDVgEiQ+rMrQ3
	lONA+4dxorrFMlnq6BxBJ68cglMBk2fiGjDr17YN/0c2w8oZVpwd9ALbkaggGKEFXNseuT18/ue
	qpA+SbhpJEVru1z8cCVvPJ2kDGv9
X-Received: by 2002:a05:600c:1548:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4bb88800013mr112919255e9.6.1795215583402;
        Fri, 20 Nov 2026 14:59:43 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm128863475e9.2.2026.11.20.14.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:59:43 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 wireless 2/2] wifi: nxpwifi: validate command response size against buffer length
Date: Fri, 20 Nov 2026 22:59:33 +0000
Message-ID: <20261120225933.1148680-3-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120225933.1148680-1-tristan@talencesecurity.com>
References: <20261120225933.1148680-1-tristan@talencesecurity.com>
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

nxpwifi_process_cmdresp() reads the firmware-provided resp->size field
and passes it to individual command handlers that use it to determine
how much data to process, but never validates it against the actual
response buffer length. A firmware response with an inflated size
field causes subsequent handlers to read past the buffer.

Add a check early in command response processing that validates the
declared response size fits within the response skb.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v2:
- Move the response size check after timer_delete_sync() so the command
  timer is properly cancelled before the early return (Jeff Chen)

 drivers/net/wireless/nxp/nxpwifi/cmdevt.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/nxp/nxpwifi/cmdevt.c b/drivers/net/wireless/nxp/nxpwifi/cmdevt.c
index fc1950a125b65..ebcfee8cb3872 100644
--- a/drivers/net/wireless/nxp/nxpwifi/cmdevt.c
+++ b/drivers/net/wireless/nxp/nxpwifi/cmdevt.c
@@ -732,6 +732,20 @@ int nxpwifi_process_cmdresp(struct nxpwifi_adapter *adapter)
 	timer_delete_sync(&adapter->cmd_timer);
 	clear_bit(NXPWIFI_IS_CMD_TIMEDOUT, &adapter->work_flags);
 
+	if (le16_to_cpu(resp->size) > adapter->curr_cmd->resp_skb->len) {
+		nxpwifi_dbg(adapter, ERROR,
+			    "CMD_RESP: resp size %u exceeds buffer %u\n",
+			    le16_to_cpu(resp->size),
+			    adapter->curr_cmd->resp_skb->len);
+		if (adapter->curr_cmd->wait_q_enabled)
+			adapter->cmd_wait_q.status = -EINVAL;
+		nxpwifi_recycle_cmd_node(adapter, adapter->curr_cmd);
+		spin_lock_bh(&adapter->nxpwifi_cmd_lock);
+		adapter->curr_cmd = NULL;
+		spin_unlock_bh(&adapter->nxpwifi_cmd_lock);
+		return -EINVAL;
+	}
+
 	if (adapter->curr_cmd->cmd_flag & CMD_F_HOSTCMD) {
 		/* Copy original response back to response buffer */
 		struct nxpwifi_ds_misc_cmd *hostcmd;
-- 
2.47.3
