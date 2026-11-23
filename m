Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401296;
	b=LUAODaNWVWoumKYjOjBwhCHICDMyRA+700bS1UsU8BZHkJZ5IpApW+QjQgnfHdwhA1zb
	 ANgdQc9z3hRACu6KBP9fGHOkd2BdtRkSzeIolmzqXolPjCgZry2wCO4pKS3odmMtNRzFN
	 uthJA5T4OvHhVusYvh2x/iBuerkhOSEItqnlQN8DGjMlGAv2lNdX4agjKq/TVj8oJCrRB
	 gtQbve7bapyvaS7h+jvXGYa7qwDTGDk/T/V/dDIdm2PaFAikPAGCeXs4cc+CxHH855lAm
	 WxguSpIqBPLNpOtXgC9wRELOtqLUZIUnZsST0pCBHh8gEHuj19/CdnMWs/uy1K83qsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MKus0ZIpKMYnifwBN/xjucnEiMSY0/cmG61Pf4wmF+A=;
	b=5tjmEr9m42+aUKTxMglLvGQv8vzcFkAqQ01KzJp2QuSbDBUkDXznoPmNg99por39Cu/u
	 G4VvVaiCLCzmcPhRwqeGEoVjBZD/4CJW3crgS/C2VN8alN3K+FPvwolNB9zRc7HyjldXT
	 +Fi9bmnGHaA9j1sjdXIBBnpqcE4GputP0OvpN+FfZ5wmUe4YFGmgyw2k0F3z8T2D1lPT8
	 F1LFM1CJu1dVuy22sPhCTrpZREafhJsNSndZMf4AwStvYJMm3OYJQ4r5dWzrq76CXSnJ/
	 4z+i0aVBEJkYWxtsV58BiOs6tjjIr4hpdSr4oQ2ddrS5uDteR3XYaqhgB40i1apz7Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=Y0hfpd5q;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E52E606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E52E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=Y0hfpd5q
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f03920c4a0so16899275ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795401295; x=1796006095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKus0ZIpKMYnifwBN/xjucnEiMSY0/cmG61Pf4wmF+A=;
        b=Y0hfpd5qTRrb+3rpAV23+M/RWWOEhKBFAs2X7rrkgPuRqB7wvs9tZmjNt6tNIaGP65
         urbu9vK7cwJsSsT3sn7VyaD4BSB7DwtlAKF+2oGJ3i83jwvZEi064o/1mYpaV9ux098k
         ia0Pw7FMerKQr4SVo59OV07X2HlJ2WGG2NYOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795401295; x=1796006095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKus0ZIpKMYnifwBN/xjucnEiMSY0/cmG61Pf4wmF+A=;
        b=e3eahH9DQ+WABGopQrRM8/SMg+InwHp0UQ9vmihnfjyAvAGWzSV9GysETXTEqLHYE7
         4fPuhFQnyD521NAZpMFwndtuf0FTzhbNVKRmn/AwKnomUsEabV2xknqYZTlWA6bKnJHQ
         TfmTM6a1JxeBx4Hcjo0y1CP5I8oY7DPmC2hMhzR9ffeDg0NDRhq53rzaiaPhq/pbVAl8
         V6owjiQMoSfrVDGNzVkOHOZjYEh4fxcGO7YowqsC3I9q9tcYamxJh3BMtQpe+ToIHfaf
         8AEB3HDDHJyVgiTRshJAbh3i1o+oBVHYi3Kw1ObpoWJ2mkLvKDxH6ZVSB5SCGRtHCMk2
         vBAw==
X-Forwarded-Encrypted: i=1; AL+hErGLXtkhM7w2nBajP2dc7iXbjXT4hvec183H/9scWa7EnLt7hfs5gDW9ZJB3Vjco141Frc7/p6c//cazyRs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+33DK9oN0BUtCJrHKULWvqkllUIVQ8O6gwtI6nEI1HHzx0lih9
	K3/HIlwJRlvhTdFex2ZsdQ9CNA6kdF7EjVnLhKYmcikWJi9f7ZnAJ/Fh6nGtJlzdoTg=
X-Gm-Gg: AZFdTZcMGYPiQEppgcbO4kebtAliHXsjrglCMi0oQIPxzuESLBXQ0Lapc7wfmzfJU6q
	Oyr0dHvx2iW+2XAL9q6aM33AhIvXyCBFZW6qlQkRKsDfHK/ErFrzGZA11MmplEry4rR/dnm7HWj
	Bj/vixCdTVntZSmYOjQv6NOhhZZbW60PUYx7xy/yH1hpayhY0y8gq1pm45Lvjc3XQwF+96lqcSq
	D7Qd39ZjQF8xI2IgZlkPiO/vFTzT3ZWisy8PydOMcIIfWd3jM4colaiDfrfTgLaTwAV1AYmgFoV
	rnI5pe0xgwm9HgeBtPhYTsDm1q8BaEuNvkN8kh5jG58jOGwvvaJPsYu/2GOjmZ8ogC1i+TgG1b1
	+zhZ5mG+BO6Z3kXZjL4jd9oTB7wUmV9c3vgYnPgEga2YsdBGrQAE6bvB+i4pmjguIAH9TLCjSdF
	Iyu10S0fMmKPPrkJErx6bhZgfQFH8GsLY4BOraN9V44k78RKpiCNhW+EwZD0cMExxlDkKwWl2Bi
	18Ca3eSYtDqm+FbZB2YbjiAH9/7MBgeUWce41jIrCWBtHomLipclitgiKvmrXq30/sbuzkbvJcc
	BEEqfRUo+zMa1z3PJPggOIxiqV1fc3cEh5YoCjg10Qiq1103MMf6REGF8SOG/QWglIB8/PgHdJU
	A9rb3AGEQ1QSOylNWBZSRYDjKPgnObxDQaxN6lYlxFeyOEcjvbkA4bQRCe4+TuX0e
X-Received: by 2002:a17:902:e803:b0:2ef:ea94:e04c with SMTP id d9443c01a7336-2f03ef3d413mr102290175ad.3.1795401294648;
        Sun, 22 Nov 2026 18:34:54 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84027sm44590425ad.7.2026.11.22.18.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:34:54 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH net 3/3] net/nfc: nci: do not hand a NULL skb to the nfc core
Date: Mon, 23 Nov 2026 08:04:46 +0530
Message-Id: <20261123023446.3350387-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123023446.3350387-1-piyus@iiitd.ac.in>
References: <20261123023446.3350387-1-piyus@iiitd.ac.in>
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

nci_add_rx_data_frag() frees the skb and clears the local pointer when it
cannot make room for the data accumulated so far, then falls through to the
exit path shared with the success case:

		if (skb_cow_head(skb, reassembly_len)) {
			pr_err("error adding room for accumulated rx data\n");

			kfree_skb(skb);
			skb = NULL;
			...
			err = -ENOMEM;
			goto exit;
		}
	...
exit:
	if (ndev->nfc_dev->rf_mode == NFC_RF_TARGET) {
		/* Data received in Target mode, forward to nfc core */
		err = nfc_tm_data_received(ndev->nfc_dev, skb);

In target mode that NULL reaches nfc_llcp_data_received(), whose own NULL
test is on the LLCP local and not on the skb, and __nfc_llcp_recv() then
dereferences it in pskb_may_pull():

  BUG: KASAN: null-ptr-deref in nfc_llcp_data_received
  Read of size 4 at addr 0000000000000070 by task kworker/u8:0/13
   skb_headlen
   pskb_may_pull_reason
   pskb_may_pull
   __nfc_llcp_recv
   nfc_llcp_data_received
   nfc_tm_data_received

Test the skb before forwarding it.  The other branch,
nci_data_exchange_complete(), already accepts a NULL skb and reports the
error to the pending data exchange, so only the target-mode call needs it -
and returning early instead would leave that exchange uncompleted.

A peer reaches the failing branch by growing the reassembly with PBF_CONT
fragments until the GFP_ATOMIC head expansion for the accumulated length
cannot be satisfied.

How this was found: by AI-driven fuzzing built on top of syzkaller.  Its
analysis was then checked by hand against the code, the fault was
reproduced
on net.git main under KASAN, and the patched kernel is clean on the same
reproducer with ordinary NFC LLCP traffic unaffected.

Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/nfc/nci/data.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/net/nfc/nci/data.c b/net/nfc/nci/data.c
index 4253edea5..d7597fbd2 100644
--- a/net/nfc/nci/data.c
+++ b/net/nfc/nci/data.c
@@ -258,10 +258,17 @@ static void nci_add_rx_data_frag(struct nci_dev *ndev,
 
 exit:
 	if (ndev->nfc_dev->rf_mode == NFC_RF_TARGET) {
-		/* Data received in Target mode, forward to nfc core */
-		err = nfc_tm_data_received(ndev->nfc_dev, skb);
-		if (err)
-			pr_err("unable to handle received data\n");
+		/*
+		 * Data received in Target mode, forward to nfc core.  skb is
+		 * NULL when the reassembly above could not make room for the
+		 * accumulated data; there is nothing left to forward and the
+		 * core would dereference it.
+		 */
+		if (skb) {
+			err = nfc_tm_data_received(ndev->nfc_dev, skb);
+			if (err)
+				pr_err("unable to handle received data\n");
+		}
 	} else {
 		nci_data_exchange_complete(ndev, skb, conn_id, err);
 	}
-- 
2.34.1

