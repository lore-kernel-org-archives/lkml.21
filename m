Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222106;
	b=pHcWtQwnkd8MA+JTXCcvIA42jo/eIjCNfw+h5Dqff8684VFp4p4Iq/JgzPmS+n2fPNZp
	 3u4SSmCjfjclSrW8JmjrQNTXNf7rfyw9vQnlW7KXh4x7SQBh0YjJYnO+j9VAnJUzoPMrd
	 g1uX+ps/Bg20e/AEOUitOZ+h2WAJXK+JiY62R2yENYi97owCmWjmOoLRFX8fHDlRGijk/
	 SD9UrXAmuNdB3Qr1Q/CaYyo84vRDjIkts0JXotcHvWiuA7iUTiE9ijmfrjyB3kV0ilusD
	 JB7SJpsfZQmzNNS6VAi5zu1BvYTdz8EmisH/RujOS5lvuuoM6AStoHbmu6v7BEDPF1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aFPoSxt0aWUwwqX5xUF8SwWRu98kYFqbtHO45/HLvLo=;
	b=AVHYewzJuYk3EZkexKSgS+hmkqAaH3pWLFtM6gUKhDrzL5Q9zCiaKoL46YxZn0cnNA/o
	 hAdbhbrVbup9f24NnjtkkOz/Pldk/pYbYjd+YWr7iY9baFNAs9zDH+dtsNdUhdRiJNauH
	 zH1v9PR0pLB/OdO1ddrtaq54T3p976qkJuI4O5DFVjn0D2o3I/m0zQQnCwtzIMeDhcEEk
	 xW6V2XetDfWsSSwIQm+Gyj47zppJJZCCj20NnZUnBokJGx0PMwXXbLna7MepJYvaX4vsd
	 CcBJHmsRpV210UcF4qjTxyouapMYBvFQZUp+Ly6InkXlk0ZegOUYzBdds2oIQRVMgEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j5paIkky;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E478606A6B3
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E478606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j5paIkky
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2761c69fbso3019935c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222094; x=1795826894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFPoSxt0aWUwwqX5xUF8SwWRu98kYFqbtHO45/HLvLo=;
        b=j5paIkkyGMRCwCSCH4OMqfQvxzsz+SywGoAE5feK9lOz4XS4Eqw1cD3uTlmZfBKjjO
         exCM0RAmo0lrulEzkZU5k5cw4ilRr9p3f7+NGXbi1aukxxRwXjt32HAyoE52W3RCY+tY
         Wvskq9pptmEjNfxP39rxtQNlg9UPRpNk1PHEo5igWrn1FQrus9fS8XyjTVpAZ1UmrmYX
         fXWxMgmbqhY2MLnMvAGMb/kiKFK8ubD7ZqVLnWacsde+Awu7SAXVqzY3cGRyjMHXMQNF
         zhL4LMYf5VAKXxJ2oLRosJLfI6k6RX+459QloyqO2M9rO+nS1K6lHZWS9TD1TXfrEKRN
         LOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222094; x=1795826894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aFPoSxt0aWUwwqX5xUF8SwWRu98kYFqbtHO45/HLvLo=;
        b=oST+aQKlYX2Gyi2FaWbaRXYa1roS9bgPthsDDviwA5Vt+zofIf+VtXnCB78KhlIwuf
         vmcY5ChEcO2T/y2ggCfphrwPkxkDY3mWf/AIhlxDefF53u/gHBF9nqt50MNtKXaIiUJd
         rYrxUKyovxwb30NfebPXnZhJ288GPxY1nnDRE7ZVe9wwX9tFJIRngKn1m5TF+5Oo1lJx
         dHtcYxBnLJD3GiO/ozFnqKsfXRXNMYgJh4tKnyXhL6yI2ERw3BiRHZS6fyFiVR314V50
         BI5N2JJEKK7kebBCDZtC0V3jtH6gJGdiDHf0Z/O4TOzTdrQTO3XLo8D37SjB5Ws0rZBW
         vgKQ==
X-Forwarded-Encrypted: i=1; AL+hErEC5NnfwA3Alr5yVTG+7oDHFJWF3rqYIE6GCOIxVtdbNfu8ouCi9dX5tvwD/uLThJCQq5HTT0K+376wctk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VumDaeu7n3lsTNaGpUfcCrBSDaUbctEqi8En0qsaJxyf5Xwko
	8JnkDrABQUg2tjAHdHRk9Qei9WQ9lhYEqSHYQonMaT0pIcieCiht+NY/
X-Gm-Gg: AYBFou0Ou/1n9BAup1Exyn0eHNXb9WeUIA8uAm561RtDiuxWVJG+FZWC8gpcEESyBNm
	Uk2N08yjYzPviwiDPFSLdEc66AP8p6OfoSy4VbbAy5QM5KAZAznCt5OGN8wV+nVflOvsgU5gmzm
	AOwyI/yfLWl/oj45tVkF3c7cCu2/bsbNJVVv2Zga7289QLlL11nEKlQtW/XTbqgMZoRIq5HnlSN
	AUxIf7UutCJ3dQ130T4ag/M+WVxcywL1KQSDTW6bvZ5+Izdqun5zEi7vuSbqPYPouNGMJWi4OAm
	QQ+5GiNax9lECjfvQBTXP8UXvITzXpdbR7DxGCtqe437t0To7ju51AYlIcRYgu4+auozZlWplkZ
	F+6x5N16uHPa6VTpubIAY28qE4C7u/srUwL1b8cCkCneMqOyMBxZ0ANIbAYiLFPqv+Oa0R/76Re
	3/cXQufSQZht+iP16SBK9Tdem+agA4wKhLDR1RFvQUCV+C7eXBC9YOk/mox62J3a2HgRGpHKVZ6
	hAxbfr59388CivAnkKIU3RoaMyVnZ49koiNqViUKHWlCbMByfXjDggeBIN6wdSjFilXuha91dPd
	PLKCZLKZivuFL4lW1zDIhD2Y3ntd1xU=
X-Received: by 2002:a05:701b:2313:b0:151:d6e5:596b with SMTP id a92af1059eb24-1b5568b31admr4284679c88.9.1795222094302;
        Fri, 20 Nov 2026 16:48:14 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm11462472c88.13.2026.11.20.16.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:48:13 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v4 02/10] net: au1000: clear all-multicast mode when restoring hash filtering
Date: Fri, 20 Nov 2026 16:48:01 -0800
Message-ID: <20261121004809.1690280-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121004809.1690280-1-f.fainelli@gmail.com>
References: <20261121004809.1690280-1-f.fainelli@gmail.com>
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

MAC_PASS_ALL_MULTI remains set after IFF_ALLMULTI is cleared or the
multicast list shrinks below the filter limit. Clear it when programming
the selective multicast hash so unwanted multicast traffic is filtered
again.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index cd25248f4e3a..58bc8e1b539d 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -1042,7 +1042,7 @@ static void au1000_multicast_list(struct net_device *dev)
 					(long *)mc_filter);
 		writel(mc_filter[1], &aup->mac->multi_hash_high);
 		writel(mc_filter[0], &aup->mac->multi_hash_low);
-		reg &= ~MAC_PROMISCUOUS;
+		reg &= ~(MAC_PROMISCUOUS | MAC_PASS_ALL_MULTI);
 		reg |= MAC_HASH_MODE;
 	}
 	writel(reg, &aup->mac->control);
-- 
2.53.0

