Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998473;
	b=u/sHKBE1++BLBw606eZeXRs3p0EXkN1yJJirY8hTrAPYY3Zwxk6A0r4D/PCTIgCfh830
	 XNv+06dTxryvVtWjxqzTgYV+Ap0r+o0veMzaP6UBt0tZiasdIHLL/XDjPLKvJjweDBAB6
	 yoMxpHxiV4AffR6tMEP6KQGz7DqoNUK6owksVi5Hnwp1jcJnsjAmiX6ZZyBVVpKh4EyKi
	 a7bM+5fGat9B1jV7qgqF0aTIOaBcDBnuifTc41TUtSBuBOnXxZyUekZB3N02kbAiH23w1
	 h//pi6YSI621giZApqkGnpNuWyKIvg8xBuulPEplw6TVhU4dKqKHU5tiJ9jnehf9phA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+/1aPW2sN47IVO6KfZ/XPY38JhDzQlQVktdUgLy0gIY=;
	b=UO9t500OnL/eSplTmyWTd1ResIeZTfUSfrwmQ4CPxJwLhf0mZN4fwCwbDZb7EmUrh6K5
	 8Y3AS8UzEB7hsyBtlJs6Tnczz/OUqXM2PJsYWOH937G2j/3YfNnO92z6ihsfS4wFhsOeH
	 jxIe74Qzjt092H3FpE5hnKq08p37hzP27d2yXVadUYPqLmeZCmcg92l07PydVdoQdMcYH
	 WHxNPEtcMFt/p39LGG86/RYrAFNi+SoMkIh5SNILJpt0vgmVhZrzO+TPl+/R9+TLyxcQ+
	 ETOYTQmyfdwaAOdDW+I/iMeH0f4BbdRhFaz/NrrRZqNUZP6oXVsVNTURiq653uC0wvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J8pbIffx;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8435860A261F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8435860A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J8pbIffx
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492f563d1c6so244653f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998472; x=1795603272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/1aPW2sN47IVO6KfZ/XPY38JhDzQlQVktdUgLy0gIY=;
        b=J8pbIffxRgGmshxEwJPmzPFxDB3z5yCpj+t9D3OPxNAWVcY87yyl3UWUtLLamAPDxC
         YOGXCO/lpomIOtOmttph0nOW9c8OZOHrMQL7AFmlGJY5R5pcMwIvV9JGckC7i1lNLt3m
         DT9Fq5YvJf1tzpXyy2a8mRpJhQbVXRHiUvvJ4jjgSBu070c91CLxn905lJdwY6XpYEnI
         pyiZKTwNKwFKl90TkNpeYutQ8bE8W5kC/6wIQ8g4yjU0PjveIgXWx8OKvV0i9vIevOBZ
         OjS5JJkMrQhK0hmLfNa2mzbQykOkeP4nA6UbD6nB0lsjVAALpsFAEGjqu7fejzgzNgyO
         TDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998472; x=1795603272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/1aPW2sN47IVO6KfZ/XPY38JhDzQlQVktdUgLy0gIY=;
        b=CHu02HXZ0sKK0efmRoBUBEW459p0Nda+7+NCLjANXF/TfUqFz7IC6nKK8q2v7BWFLF
         7M7QrhYz99mkocwktTvPEP8eiGcgB8YJqiT9t+71TrrwWOGFr0GrwR/0cVvcxWe+1M0Q
         L0i1FSRh8K9kmGfgRDXCsdcWKEPSN/QCG9iIvoISIzl93ZQez7rCjk6DAVLlAPtlwJkp
         jdYNkxA9JtRU5dtnLqtcFk5T52sp7Rz9FBdzMVg3Ht8FXRGExNXRtQIWu+dxdBn1tF8s
         HFjOP4NZkwKBGzk/kZzeM2A++vDuvar3YklFKfgDRNKaKOafjn8im9dGqK4McvDtCXgb
         TPAA==
X-Forwarded-Encrypted: i=1; AL+hErHXoOGc9I+kV5n1WnbeJ1Wo81eq44jt5WrMgX/Rz5v2Q761cFve5rbecrnjdVlowUnxLQwI0460YBotvu0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o3CSHO91nlnj/gK/AsIdawCeWAP1DVeB5hiVKDt2Yzs/9H59d
	VzpulxcyU2Xi0td7cLQsFBZ2OerYZngSXsGoKLhY8XSxByjbAvKUVzRa
X-Gm-Gg: AZFdTZfvEjeFvkW8+Q4Pd32YKSxwF7lN1ydNzJcQhRu3RsJrZNR43XDEsRIqc33RQJP
	Q8UKIsUmjII36haNDQ6P1uHj4CTCe7ESbBXgtfEeSVtF/QM+tyu+eKMix/bC30geCMtAXwQMXNV
	M3eT3FT8V0Q3QE92GoDerA51BdF+j+/k8f0uR3CabCGx+r0HQKN+T4HBbXMK0abLi152mjbSBGz
	YQYMOjJqMJQTJof2wNfVR/+EfeapmzSgiHaDmWtmT8rJeCgrj/Ioj1DzB0JlAgOQVoCVn1vl93E
	usI/oQyHM04dCxBdCH67qZ3hyM3EQE/akLUPJ/lkXLsJAc+OC2aU2cYR8XMlO3JBn0d3ZCAuXGp
	XIKNdqmM1uV5mj1aSVXogglQ74bXFZ5W8pUQFj4EDWmo1VY/aTXmg+iXUQ0qe7RMjRagM7rUS59
	dfTITuAtYGX0TY3zZGwy4Os7PvuTsUgsjxCsXrT/OzQnZasoFjdiQfK3R4zxSCiIt3tvWnO62em
	u1Sx1wvRWtPXdTB0sCFoAZb3lkkntgN0l8TeNiqBtxbppKT4k8RCkAZ4cOOfo90C8H4ViIdNB5w
	Ug/w9w2+qZ26vKKQObKQbjUS4oXbA+dZMpwyd2fqTRwKxe2m3+/KrvWOu0gMeNF1g/b4QfVm5fH
	QdxT9Czs8zLf+61lRaBAYODVJ9SQCnFFA1RY=
X-Received: by 2002:a05:6000:2587:b0:48d:f488:f32a with SMTP id ffacd0b85a97d-4a63de4db71mr4690064f8f.56.1794998471786;
        Wed, 18 Nov 2026 02:41:11 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (user-46-112-114-48.play-internet.pl. [46.112.114.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573ba95csm4320525f8f.56.2026.11.18.02.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:41:11 -0800 (PST)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yongzhao Chen <yongzhao.derek@gmail.com>,
	Alexey Immoreev <luixo-public@luixo.me>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 3/4] net: dsa: qca8k: check the length of MIB autocast frames
Date: Wed, 18 Nov 2026 11:41:03 +0100
Message-ID: <20261118104104.26684-4-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118104104.26684-1-kuncy7@gmail.com>
References: <20261118104104.26684-1-kuncy7@gmail.com>
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

qca_tag_rcv() makes only the 2 byte tag linear before it hands a MIB
frame to qca8k_mib_autocast_handler(). The handler then reads the
counters that follow the Ethernet header, up to 164 bytes on QCA833x,
straight from skb->data, without checking the frame length. A short or
non-linear frame makes it read past the packet data.

Pull the counters into the linear area before reading them. A frame
that is too short is left uncounted, so the request times out and
the caller reads the counters from the registers instead.

An LLM assistant (Claude, claude-fable-5-1) helped write the change
and this description; I reviewed both and built them with W=1 on
arm64.

Fixes: 5c957c7ca78c ("net: dsa: qca8k: add support for mib autocast in Ethernet packet")
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 4de7da9c8e..76c0f7c97b 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -1669,6 +1669,7 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
 	struct qca8k_priv *priv = ds->priv;
 	const struct qca8k_mib_desc *mib;
 	struct mib_ethhdr *mib_ethhdr;
+	unsigned int len = 0;
 	__le32 *data2;
 	u8 port;
 	int i;
@@ -1691,6 +1692,16 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
 	if (port != mib_eth_data->req_port)
 		goto exit;
 
+	/* Past the first 3, the counters follow the header. Leave a short
+	 * frame uncounted, so that the request times out and the caller
+	 * reads the registers instead.
+	 */
+	for (i = 3; i < priv->info->mib_count; i++)
+		len += ar8327_mib[i].size * sizeof(u32);
+	if (!pskb_may_pull(skb, len))
+		goto unlock;
+
+	mib_ethhdr = (struct mib_ethhdr *)skb_mac_header(skb);
 	data2 = (__le32 *)skb->data;
 
 	for (i = 0; i < priv->info->mib_count; i++) {
-- 
2.43.0

