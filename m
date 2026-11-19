Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082531;
	b=kYzIBr94PGqKU8phR/RtLCHvO7Kdznmq/UhRiNC5w7c2Fv7+wyjrPHHa8RT9k3FXSkEs
	 jJ8A47cNDvJ1uJEx0ytTFYfzJjo0fvCeG/doFrTWzP7YM6pg+HybIXXqw2+RFlAhYXoQz
	 KxGKaps/x6pi7xh82FEhyNaswwdgDMqEtdGWONXE/sAfqUNJStPZl01e53AvJwwT9DVqK
	 eW3sy69zWwLrOL+kN56rJZiKX85MQbzY4FnFPq+eIV3SalVrUJho5TPXHC6NlOyttyDNe
	 f+klbN/h3GombqEI9ZWGBP2+MMeEWENiT9i1sVjenS6jQIY02AZZjB+o6FF+GBBw7Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082531;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5NRrnpPRoICcPwb9emd9JPNK8fUgBNANt3iXcgswqGE=;
	b=CHHXYv41sRBErvZxECidg9iN5LzNuQ2xS/zJkO7ascSdP/Q/z/dbdt2r5urrBY0kE08L
	 m+Tcamj3Gp0IVqYxH/3SHePuLoHIUSizeAGfbFFFs4hkVsQ+Mp+x5mbx+oLmHRJ502CYL
	 pHKNqB2NXlhoqPaxmJWz+aBiKY/WVNZmIuY20kA2a+eQi8DGCrpyQs2H+JVVxVMKG7/6F
	 t26UwvjmM1bEOVArM2p7ReHxKJniUi6BylRNTQeUA9xSNVWc6c235G6nQOr7S0cbC5+ga
	 AXqc9hGUIZRlZAbHcLmVj08cPlhNLo09+j45ddMN87ekCTsagUkWk/Ary6c5emKLFaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n1w2Palq;
	arc=none smtp.remote-ip=95.215.58.108
Received: from mta1.migadu.com (out-108.mta1.migadu.com [95.215.58.108])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8919D606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8919D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n1w2Palq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5NRrnpPRoICcPwb9emd9JPNK8fUgBNANt3iXcgswqGE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795082527; v=1; x=1795687327;
 b=n1w2Palqw51RIj4ehrFUd0RyrRqxG7itpKZ+ojpJd62beyv52H47ocwl0hbORQz5Ni3vIZq4
 LkGE1mf8BetPpirytgvOval7CtQHO1WCglMOfhiOuCQxcVuga+MRk3Av/O3D31MljQvK4NSnbfN
 kD021myx9h8eJOb8iTPV4zd8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 8e2188403d20b602;
	Thu, 19 Nov 2026 10:02:07 +0000
X-Mizu-Trace-ID: 8e2188403d20b602
X-Migadu-Flow: FLOW_OUT
Date: Thu, 19 Nov 2026 18:01:55 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: netdev@vger.kernel.org, Jay Vosburgh <jv@jvosburgh.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] bonding: reject a non-Ethernet 802.3ad slave even
 when the type matches
Message-ID: <av7JE91kbL3gf8MS@fedora>
References: <179505868590.3571070.12381528230330714812@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179505868590.3571070.12381528230330714812@gmail.com>

On Wed, Nov 18, 2026 at 07:31:10PM -0800, Kyuwon Cho wrote:
> Commit c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet
> devices") rejects a non-Ethernet first slave in 802.3ad mode, but only
> when enslaving it changes the bond's type. A bond keeps the type of its
> last slave after that slave is released, so a bond that once had an
> ARPHRD_TUNNEL6 slave can be set to 802.3ad and take another TUNNEL6

Hmm, should we also check and set the bond device type back to Ethernet
when set mode to 8023AD?

Thanks
Hangbin
