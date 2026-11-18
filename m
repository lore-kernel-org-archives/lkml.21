Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032835;
	b=sQLrDs75g3Ib7lJx5Qw+C2K4MHzDa8RPqC5HBHVLeHSqkoWkD9uIVmtPlOriVwzogiHC
	 FjI1hfJ171ZP404NwNBCoz+t59hxnVH6+esqHtBd3Gn/ezEOWMEfcq2LJ8HfXlZptQu/O
	 fDnp05KeJ2IXhG9Wbt8iALiOg5DuvyRBvMoFxDrI14yFu5cm6b2PuZ84f7fAbh/MLXxr3
	 29nze51CttGBb4fn+KNrlqfA7azX3HGhsN0eF2ttHRC+Wugjs3RwYe4L12HlqCU40hdSM
	 SUF5yNC5YNff/DkNwWkakBX2buRVJOgqvWecKq0CCYD5bR3V2E/3l7blLNg126/SEJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032835;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=lDXhbpMKUl7ISgBnZfj/IedauZ9SDiSIZpfzv9Z13y8=;
	b=i6MSoNAPq89OUxRz4Ni3VfELDVG8n+xnNViqJTXqlSFfzEJK3I9/QohpXTNvVSzlFCrz
	 qvp+ZlriswJh5yOu41wyUKxrnFq9CN1U+cT2ONKG3J9GtcSqhmdmPAGW2zPtE6gXUq7V9
	 xU2eTCSBb92D5T/McTWBe3jz2aOkgHtkOJFhErsyNosKOuc+s7Z5TpV7JPtYJ8QU8lJjm
	 CWT3q11lkxde0REuyuROdQM1si3r/SLBOhl3SpQ0l95q5bM5ruu4RQzOR1WKZ+xyaAazO
	 MH3qBDvtFVod65AsxIXM6LmBHwWst25gLR0JEmyNk6ZRm25k0m8v62sxJnaVfJf3GvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Jpep7sDz;
	arc=none smtp.remote-ip=209.85.167.228
Received: from mail-oi1-f228.google.com (mail-oi1-f228.google.com [209.85.167.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6635D60A261C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6635D60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Jpep7sDz
Received: by mail-oi1-f228.google.com with SMTP id 5614622812f47-53ec9237600so617451b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:13:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032834; x=1795637634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lDXhbpMKUl7ISgBnZfj/IedauZ9SDiSIZpfzv9Z13y8=;
        b=TObKGH7CbNpnjlZmRkHRnc2TsJgSBPKPdcsoKkBv1KOHzi/Sc9QSIVk1IrEffEZmxU
         mMuIS3oWWbo/foN3IxHVeXaanJG+WOtvAr3MIUDUYcOahCRea0jGzchYzoBhsuGN0Pad
         bRdcpLJB+E4k0cMDME9HatLCTaeT3lKeLQSGO+POItxPcdirG5g4P2XPiVtpD31S+ygW
         4wzrsBN+qo9ctIX8t7GuxYaV5pNjMSBZXIluquoPJeo/fbtLaqbHCbMosJjmI7Y3wO+3
         XTIg0iykH+zhJ8NtV8CNqlpm+AANhi+BW0uNHhfJRo4wd8fl44BGExMHloa9u+SR+lQ5
         wCzw==
X-Forwarded-Encrypted: i=1; AL+hErGLrsrawXkBc4GLbqw1y4omGAdwkDYX06GQfOnp0U013Dz1umrDYFuu7wa25yP0YgNTbWvSJcKVBGcLBko=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BNxNtH6EjbZOmjY9sLGnv9mJBvhwyUJmw5Lk0RlToblVQNZQ+
	HFYxxI1eqV1jkYhN8ZG8fmcsAbgaNre8Ui9hUZh9/zYwbh531Xohdb7Q4XpRpcMBpVtYqbaQR9/
	wLgniieB0nN+O1zafSNb7XpYD8yu6WIqJNNthycSSLtGQ25HovksWee/5Vczy/pGjpgE+Cs2QXr
	VbbVuzRS+CQqBnh7tPMlwrXsgpNFAvZXDL6xS5Az5e8TCgAkCvt9AqQTTmcPcXtM1Ou0zNgcJqo
	i5VvISbSZveGlX/ABOHaxEL
X-Gm-Gg: AYBFou01jA3nStkt6N9f1f+69XD07UhuXjL5iadh7C48HzZRthUKJzSjrpzAUgu+urO
	jIEgtXn8Svhw57DsbdvPa9GuGRwzpra9cECEaRUgRf/jGoTmlp7bRDmCER67AvPa6IAvNUjZaRR
	mTGjMpYG9bQ8xaMhzaJgZL81slbK8ukXpvVXkperBEI2F6DmQMxz4PLBACnwa7TIG46+t7WFozZ
	pNgMzALtttEZrkVTvqwgs+Yt24VU+LMTpDdGPPwOL+dn0NaUMbeIfT+2gdjN3gB6SYdZF1ilVyZ
	eYJIGDnu7XUwjJq4nehH0YNxsweS89YI8dMUiPIWRYgowug/yX6kIkbc6u+55orC+L2vyFgSPyJ
	op3KlzSuy+UGgrbosW+87zyuJ/+A6sC/olua0gwxP7x4dW0aWe3E+acweJYkVXvjStzgReD8ox8
	s0qcK10BSgR8WZ3nSYAzDwMa490pYvHB6fXasCA5BDj2Q=
X-Received: by 2002:a05:6808:3a0d:b0:4f5:e12:b47c with SMTP id 5614622812f47-57742416c05mr4001240b6e.48.1795032834269;
        Wed, 18 Nov 2026 12:13:54 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4b744c29c0fsm37209fac.10.2026.11.18.12.13.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:13:54 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55b9c13273dso24329821cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795032832; x=1795637632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lDXhbpMKUl7ISgBnZfj/IedauZ9SDiSIZpfzv9Z13y8=;
        b=Jpep7sDz2EJWI9hZMR2W0pc+SzWJf4CIrgdpDZqXr9JYyExwWMH71NbYuJ6s7WyY8B
         HlAplMcZDeObXddACBH9ztkkIgoZEsz9dfhA909cJyu4zoNjMwS8KFffuFaJdUHa+bti
         IM0ZeUpvk6UGOin1OLdfHMySzP6fXtO666MoI=
X-Forwarded-Encrypted: i=1; AL+hErGQnScPMWnpNXZOG65xCXtSTG4G2EZNOiQLXyt6/sOSRi/F6t3QAIC5bRfhIwgZdAaZNgw47LNLvbdaFQA=@vger.kernel.org
X-Received: by 2002:a05:622a:2306:b0:535:a5fb:6446 with SMTP id d75a77b69052e-55d5a7351damr52255301cf.64.1795032832260;
        Wed, 18 Nov 2026 12:13:52 -0800 (PST)
X-Received: by 2002:a05:622a:2306:b0:535:a5fb:6446 with SMTP id d75a77b69052e-55d5a7351damr52254921cf.64.1795032831764;
        Wed, 18 Nov 2026 12:13:51 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66c2a5a2sm7675091cf.21.2026.11.18.12.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:13:51 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Toshiaki Makita <toshiaki.makita1@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Subject: [PATCH net 1/4] netfilter: flowtable: do not queue offload work after DESTROY
Date: Wed, 18 Nov 2026 12:12:47 -0800
Message-ID: <20261118201250.2075007-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118201250.2075007-1-florian.fainelli@broadcom.com>
References: <20261118201250.2075007-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

nf_flow_offload_refresh() can be reached by a packet path reader which
looked the flow up before it was torn down. NF_FLOW_PENDING keeps the
DESTROY work from being queued while another work item is pending, but
once the DESTROY work has run and cleared the bit, a reader can take it
again and queue a REPLACE (or STATS) work for a flow which is already
being removed.

GC removes a hardware flow after NF_FLOW_HW_DEAD is set, and frees it after
an RCU grace period, which the reader can outlive in a preemptible RCU
read-side section. The queued work then dereferences a freed flow and
the flowtable, and can program the hardware again with a rule keyed by
the freed flow's cookie.

NF_FLOW_HW_DYING is set when DESTROY is queued, and DESTROY needs
NF_FLOW_PENDING, so a work item which holds the pending bit and finds
NF_FLOW_HW_DYING clear prevents DESTROY from being queued until it
completes. Check it after taking the pending bit, and do not queue
anything other than DESTROY when it is set.

Not reproduced: this is a race between a long RCU read-side section and
the GC and offload workers. Found by review of a related change.

Fixes: c29f74e0df7a ("netfilter: nf_flow_table: hardware offload support")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 net/netfilter/nf_flow_table_offload.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
index 4365859220e6..62f460d38efa 100644
--- a/net/netfilter/nf_flow_table_offload.c
+++ b/net/netfilter/nf_flow_table_offload.c
@@ -1088,6 +1088,19 @@ nf_flow_offload_work_alloc(struct nf_flowtable *flowtable,
 	if (test_and_set_bit(NF_FLOW_PENDING, &flow->flags))
 		return NULL;
 
+	/* GC only removes a hardware flow after its DESTROY work has run, and
+	 * NF_FLOW_PENDING keeps another one from being queued, so nothing can
+	 * free the flow while this work is pending, unless DESTROY was queued
+	 * before we took the pending bit. A reader which found the flow before
+	 * it was torn down must not queue more work then, as the flow could be
+	 * freed before that work runs.
+	 */
+	if (cmd != FLOW_CLS_DESTROY &&
+	    test_bit(NF_FLOW_HW_DYING, &flow->flags)) {
+		clear_bit(NF_FLOW_PENDING, &flow->flags);
+		return NULL;
+	}
+
 	offload = kmalloc_obj(struct flow_offload_work, GFP_ATOMIC);
 	if (!offload) {
 		clear_bit(NF_FLOW_PENDING, &flow->flags);
-- 
2.53.0

