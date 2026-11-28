Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795884728;
	b=FXetppsNmr6iCogkbU3Hirh2RkHEKHD2cm0QqWs9th8raXmAdab4r6fhYMJueFlovBLk
	 o/TgOwDoeZvqOoOwWRMoSwy6ke4bgB/qL4NnnYaCkqaNXcbVrry7jKUW+A1kBXOGGsFYN
	 ljM/SGuwbF6Ci1107skKefi9DFhuGjYnnNHytLLBUu6c41U0gGIsuTXCIlWpqjHARq1mD
	 IH/0/XEciMZrUqP3FzGqx7VtgX+Tv5FzT15oy4OBiw9yCQmmFbUPsIRoWALBcERsh/iNG
	 jMozCfQqGq41trpbNPJ0JogFdIPjMMYie2GlnXLe/e65MwO1mvIxS8BvPMbxWrk087A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795884728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hq9Q2ZEjxeSchaVa6XJLHjHDJ6LFM82ziN2wQ56C/ao=;
	b=Ph1amRD4u23NrTVsSbswL20S2hssL9dZxZHFPBts1M8I3EJuF57O6+WBz51aX38P+P/p
	 ixnG0/3vLc+h4BY4N0RoTB3nlfGumGS+JBWrIYZTZtfhW/E+DSQO0ZKZcgkC8SK0SALNu
	 8OHylZ4etulg5M6VvCI6zHYvxRPc7tXYvjdAbcN+LWHqODquBO+VDIwHVb51aUebErkng
	 q0p1tcYPL/3aDhLCSDfWVoDVKNP22Rvrps70ln7BkemhQA07RE2X3dcfnBC9U8C4rDGtn
	 CgZGEcNu2AHc5v/TxTxtYnRn/iXtWGgvEMKqK96PA2EBrVjxLh6fWNXPseCUK2v+uww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="W9J/8kQE";
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0552F606A331
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0552F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=W9J/8kQE
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c5118deebcfso1354990266b.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795884726; x=1796489526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hq9Q2ZEjxeSchaVa6XJLHjHDJ6LFM82ziN2wQ56C/ao=;
        b=W9J/8kQEBwT5AiUhA2UxSuu9YqXD5+EIxiySYEjGqaIngC6XtantBVfLxbwG1QdCPz
         BY98zCX/XgJXCTM6ozUfdpEDUu7/3jtrv71l9rHI2HoAiuU0R21zovrBd+Uo9mXsk4Tq
         HBdw7pzIXmDpNuk84rM2sm52bjG/aJrrCpvMp1fwycXJd6wBRmhNE1fprsohrvs+ZZd8
         KCwluZ3o1DPCbo5facQkkhc8ahnPN5+EEfzNbtLYWwTZ2Onb4zU/FcK+swjTRpx4vc8I
         M6BGMHF2/TM4CrOBsf1M85pbIQhXCoq8v7/EaIqp8wzl+NNe/K+FCQDoAiifMQka3iVq
         II1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795884726; x=1796489526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hq9Q2ZEjxeSchaVa6XJLHjHDJ6LFM82ziN2wQ56C/ao=;
        b=LwXghr+xLTmbndn7XZ5IGFNHhJI7mt89vP2+fqDIcPt7Z2YLV4HDkkd8YpPKK9TW9p
         e0Vj9w+SZCmPgDHicaQ0f/yKyDIs0765IXqdyC43DGoAVsQgm1J+TH3+ubji6SroSwL/
         jbSlvNU8t4nXAeOQpgKs8pktdSFvrjX79YgyFyszLSJ2STtFRNDPknw57lz9ZOTc2xPi
         0NAQoa54/xVoXmw41foc7hnzEtnGcOlywpoWTtcfMsrM+KUYPTW5/aadu/xCahD01SvP
         6/O1CVuAaEHnF78HupbI4RYY2cH4QQh8xIiTkqbdfrb3yyXekzRwNd36xnATGs8D8gKN
         SnDw==
X-Forwarded-Encrypted: i=1; AL+hErGFbuuL5laoWOR0mc/6RZghqPyl103ZKq3H4gclCOgTYfkPhVTp6ayz0NMATvGzQy6uAgBeqU7qRZOO99o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9svUQvrrBMC14FvZFblO5ZDq2NYLQm5g3sBzznh4A5HbIBBryT
	IjvZsmvQRMOn3NvSubn55s0tF+ZZPBOWfduLzbcQOO7NQzVYqIyZxhhadZv3xdYgRg==
X-Gm-Gg: AZFdTZcL5RBhE9yLplVgqtsmXIE1PkV2pS/hcijuzRJt2KTlr1CTPG0jVLfcif44uzX
	mdl9Iuk+zoqvnSA/8XpN8uMsLRJqhuI6X7xMOEOofTGFL0ZulV3mhPWMqRnQaYerC7lPgaDwDvZ
	ydcpEsTGVhl261MkPWzxDj/y+qFQjZnvg0CrkoZ/94aJuIYenJr966uZr1KusoGthdJexFyxyuq
	UsIOQWa6SHTYBnAZV+5YgwYfTEywW4i3RAv11ySG9NQ8g8FmutO3llzS+gttHp3b6TI4qBt5kAs
	aFh6Xy3F0hFS+r8+23hDHhHVbXmYG/votCVjuXzuO4sfJtazIHbHxBcKHgrpKj64/vpMvZlTDPZ
	klydppihPtE1cP6XWBh1VAGT28fBhdH7s04yv9Cqvjc7DaBCgjHH7PAwaJQnGlZxigB17XJgS2b
	t/1SJ23zkB1NcFbY4RQrF8ihLFYO+qtJ2rQS0MlnY7E28JHDQaTMsxlcCNrFeXJqTFXOhVTZMEz
	Nx0pZPjKo9RNKDoiLxvfB0WAiyIB9swgs0TEqcnQk05INhoXpnsVkCXe8ob/205pQVvr2rewRBx
	/5KDF1+OpM2p4umujaBwlmqR8QgstTRTPOkXE6ua/WvcvWM82mxefQdJ4sL/2s6yNdk+ohcXWne
	ej3ObDES14Is7uoEQnO4suqdBLdzz1CoWIkNv3zXMXCcoksR6NVClp2yFcCtdtdgtPkAizAqXY9
	d8TMeo6NbsZDTtDdv3SLG5no89yQvIBpReTyhIAt3PCqrM+O1OcxNM1ElwK3DZCRMGFbg8/yBsS
	GbaxdUYb2I8/YCM3RA6C6j7mh+yFGUsoWRqAhapyYqcD29aipXCkeNAYkbkFlex/1JzcSOcaPT9
	iZcCzIb0yfkJzw==
X-Received: by 2002:a17:906:af85:b0:c3f:dce3:20c5 with SMTP id a640c23a62f3a-c513ac496d8mr1644986566b.44.1795884726407;
        Sat, 28 Nov 2026 08:52:06 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea3537sm954627766b.36.2026.11.28.08.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:52:06 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	Linus Walleij <linusw@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Pawel Dembicki <paweldembicki@gmail.com>,
	Tobias Waldekranz <tobias@waldekranz.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 4/6] net: dsa: do not hand a switch a bridge number above its limit
Date: Sat, 28 Nov 2026 17:52:03 +0100
Message-ID: <20261128165206.3248835-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128165206.3248835-1-julius@bairaktaris.de>
References: <20261128165206.3248835-1-julius@bairaktaris.de>
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

Bridge numbers are unique across all DSA trees, and each switch tells
dsa_bridge_num_get() the largest number it can use (max_num_bridges).
The limit is checked only when the bridge gets its number. A switch
that joins a bridge which another switch, with a larger limit, has
numbered already gets that number unchecked. With an mv88e6xxx tree
(limit up to 31) or an mxl862xx tree (48) beside a sja1105 or vsc73xx
tree (DSA_TAG_8021Q_MAX_NUM_BRIDGES, 7) and eight or more offloaded
bridges, the tag_8021q switch encodes number 9 in the three VBID bits of
its bridge VLAN (dsa_tag_8021q_bridge_vid()), so bridge 9 gets the VLAN
of bridge 1 and the two share a broadcast domain in the switch. An
mxl862xx tree beside an mv88e6xxx one with 32 or more bridges overflows
the device field of the DSA header in the same way.

Return 0 for a number beyond the limit in that case too. Refuse the
same in dsa_port_bridge_create() when the bridge is found in the tree,
where another switch of the tree may have numbered it beyond this
switch's limit, or not at all: an mv88e6xxx chip without a PVT has
max_num_bridges 0 and leaves the bridge at number 0, which a chip with
a PVT would take. The port is then bridged in software ("Range of
offloadable bridges exceeded"), as a port that joins a new bridge
beyond the limit already is.

Found by an LLM review (Claude), and reproduced in QEMU with dsa_loop.

Fixes: f5e165e72b29 ("net: dsa: track unique bridge numbers across all DSA switch trees")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/dsa/dsa.c  |  5 +++++
 net/dsa/port.c | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/net/dsa/dsa.c b/net/dsa/dsa.c
index 2771c34e840..1c2a29678ac 100644
--- a/net/dsa/dsa.c
+++ b/net/dsa/dsa.c
@@ -163,6 +163,11 @@ unsigned int dsa_bridge_num_get(const struct net_device *bridge_dev, int max)
 			return 0;
 
 		set_bit(bridge_num, &dsa_fwd_offloading_bridges);
+	} else if (bridge_num > max) {
+		/* A switch with a larger limit, maybe in another tree, numbered
+		 * this bridge already, beyond what this switch can encode
+		 */
+		return 0;
 	}
 
 	return bridge_num;
diff --git a/net/dsa/port.c b/net/dsa/port.c
index 997e68cd215..9cb441d16de 100644
--- a/net/dsa/port.c
+++ b/net/dsa/port.c
@@ -426,6 +426,16 @@ static int dsa_port_bridge_create(struct dsa_port *dp,
 
 	bridge = dsa_tree_bridge_find(ds->dst, br);
 	if (bridge) {
+		/* Another switch of the tree numbered the bridge beyond this
+		 * switch's limit, or left it without a number
+		 */
+		if (ds->max_num_bridges &&
+		    (!bridge->num || bridge->num > ds->max_num_bridges)) {
+			NL_SET_ERR_MSG_MOD(extack,
+					   "Range of offloadable bridges exceeded");
+			return -EOPNOTSUPP;
+		}
+
 		refcount_inc(&bridge->refcount);
 		/* Pairs with the READ_ONCE() of the datapath */
 		smp_store_release(&dp->bridge, bridge);
-- 
2.53.0

