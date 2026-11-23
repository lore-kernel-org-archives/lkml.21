Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417657;
	b=UTIgZuKu3J3znLePQnybt/n6qTH/L72Jn4qIrlfmT+RevbN6S9b9fSrrB65A2KqcYVbS
	 puBqrUCVf1NC64OFC7cMk7Fxgj58NkkI6batVIs/Gn12s/zdmgb3A14WaOrLR4swoDILG
	 lgIA8Re/FYYlAYESqPatnE+m8XH3WkRE/+HRAUeK0GmFS8PRshllL7/CNJDUbnYyt894n
	 gPbQROpV1gB3cQR5+PoIft27eCTCmv78AJmutpMMoakjgv1cQx1wSNj9sThbmyuEA5KTp
	 5f0NretaI+01evckvebHKY8mDoRwgUzO36urwnNatFBcYzE8CaE1DUfqzi7toVtp+tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=MsxSnERYYFOLpooDmz9phzS6JSJAH8F8JlBPwPYUgdE=;
	b=itrOX9ttehvx6aJ6NY6tZH6DiYuoeBBgcLghAsD9xO3l4CjsJl+RzAH8z7UPfGl2mQNp
	 QQWqkP21DamOCZvFmSxy1wTGtKvJrGz+ePvYzWs/vTVgWhEI4fNKXhZf95c+Q6SvphyZ7
	 1mxSiGUC1tk/6kpjJoQ4s9LbDXB5rF12Xwdv/lUIs+2aiOMe4PxRUrfGMjutGMz084MFG
	 VcIoXt75R8PQ+OMtfFLLa3amZWbWmHw1fuXB+FtxWBpqGxqqZzzVqI3Bksdl2vPa61mkG
	 3UbJwlOFPTbMPvpC7pZntrvOUVjZ/vl0yuh9xVQ/hbQ08WE7VY7Xfc1YcFXaq6ci+tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--starchang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=U+lWctsR;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE8E606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BE8E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--starchang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=U+lWctsR
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b8cef34b43so3378687b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795417657; x=1796022457; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MsxSnERYYFOLpooDmz9phzS6JSJAH8F8JlBPwPYUgdE=;
        b=U+lWctsRGzRFPIowLeFXgiiB6l4PafdP0ufQnLQM460wToUfWjkYeAmQgpG/S76Dff
         hF4P4QUg39kTO2662erx1wIxq1ld2FBQcb7PTTzaSxgaAK6ZhGxEAtwOwG3Cr54uGUpR
         po2M6XPV6Jr9wL9YBgYZhNuhAXt47Uyg6TR8b3BpULTyrf3H15vDbkhc0nMoBzkP/fac
         dpoHwMlbWi6wHi5jJvj5WxXHdcbIlkWQR1UDaFWl6eKEjxqqBqPbjnqX2vVWpyFGyA3v
         xKKrisqHYyAXaBI3qcAqlIxnAKdWdGIhDwE4/AlcXYFIdm5SnZcuIanTpwrfJFwOO5Ea
         18bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417657; x=1796022457;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsxSnERYYFOLpooDmz9phzS6JSJAH8F8JlBPwPYUgdE=;
        b=Fr/ZdGhQM9BbxVGYpu3e/wTJ9bkYc+HoRJ/TBJkxTStn6lvOiE2xBKJlyPWF1SdKd+
         UfSwACPg4R+hKf9MP6vzzM2eoKSVDvoHiqWFJj4P9V/ygg3tCyV5fJQXAY1lLdDpzY2k
         KGSLhKEWcbjEHZoaA0s9Fa/coDYKndu9r56q3t2900HbeacN4wHV0O2G0ROgWJwrPlzp
         A4cS1FTrxmihOPmw8UsT+Apk6/8t6sddK/Zp1u5XxeFi9S4XnCrX5CrB8F2pAWqO1mkF
         4UsLqJJDk7qGMYwB0DPRVZkNPbkcuBuQjnlbt/86JK5NP794anJFd4wNrleXTxlQCaMA
         7t1w==
X-Forwarded-Encrypted: i=1; AL+hErHRz+WxJ3iY49xalacTEKr8Um9SWIjjlCAtwfdCsYD/kQM6fAhBfMX52k4mOej2GQNhn5wr5UxST40OZfI=@vger.kernel.org
X-Gm-Message-State: APuU4Z80Y8GypYf6XMKdO0wf76skah885uWwgYlys7UXGopHPp7APjM7
	Hr3m5abmWH35dLxfT9r25c92+KdU1hyAJ+pWjFW/2f0Yhv7vvnn0ak4sEXagFkGmDqFa8HLsRXa
	1SAHGX7xCoSTzKFDmRQ==
X-Received: from pfgu2.prod.google.com ([2002:a05:6a00:982:b0:89f:afc:76b5])
 (user=starchang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:984:b0:8bf:e028:7864 with SMTP id d2e1a72fcca58-8c87663e154mr10249455b3a.0.1795417656556;
 Sun, 22 Nov 2026 23:07:36 -0800 (PST)
Date: Mon, 23 Nov 2026 07:07:34 +0000
In-Reply-To: <179541590924.3294.14959742776383569350@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123063608.3665186-1-starchang@google.com> <179541590924.3294.14959742776383569350@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123070734.3686009-1-starchang@google.com>
Subject: Re: [PATCH net v6] arp: Do not update neighbours from ARP in L2
 multicast/broadcast frames
From: Star Chang <starchang@google.com>
To: netdev-bot+sinfo@kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, Julian Anastasov <ja@ssi.bg>, 
	Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wangroger@google.com, 
	starchang@google.com
Content-Type: text/plain; charset="UTF-8"

Hi,

How it was found: internal security review of Wi-Fi "Hole-196"
mitigations, which found that drop_unicast_in_l2_multicast does not
cover ARP.

Triggered: yes, reproduced in a lab setup on a WPA2-PSK network.
Another station injected a group-addressed ARP reply (sip = gateway,
sha = attacker MAC), and after the locktime the victim's gateway
neighbour entry was changed to the attacker MAC (seen with "ip neigh").
There are no kernel messages or crashes, only the wrong neighbour
entry. The broadcast request variant (sip = gateway, tip = other host)
was pointed out by Julian during review; it goes through the same
neigh_event_ns() path.

Best regards,
Star
