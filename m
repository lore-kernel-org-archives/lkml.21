Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.71.186
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036274;
	b=DJcSRxWqTOFlUHK3KwxtnDBodJY2IOZQjLUdR6dGHEdHUlDrbu9t7MfJxJ1PnY79/HAt
	 9iL6XAO+5DBDrP4iuoq0fmXCUWGWVA0w09FOxQQ+fGbAxUf3gbrRCxRkAfTuxgF44/i1a
	 vVylICl7QKPNN96wTJ22+6bHvLvhVQy4Fmdj4S4Bwo0y7Tkvg+fiuWj32JGIW22HaDLRn
	 JAFCVljmUjf4fuKCPbp+b+9Nioizaj/dY0DwNxLPybnpDRoWVpp5EmmfH8gCvXb5kBYjl
	 akAhf9Dr30qi9wxGYzhTiUeuzSQyJ22aX5lLkfyUdX/VhAaf9+GQ2qvizQMIhgFZAHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036274;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Report-Abuse:Feedback-ID:
	 X-smtpcorp-track;
	bh=H/WlOzQPaGUcxDofm4SkODFhhO/r7lebnQiNEO6E2YY=;
	b=QMVR5+d+duwgeu/niHuDrNfq1gIVUt2vXCJdUf7kQT98S60k7DZsDST0TGa27qF8SRMl
	 3m/5VSn/HTZ6UaO0gmD2rONroo2aBljZ/IavYr0m5ndO/lWFRDBpfzr8ZGaj4Ap0mi+y6
	 n4MFFpxBP/bDvrl/9S/UrndWADS0no+zU49dvccSiKT1Bi1EhCFqwNwv4e8e/lgE788U2
	 10sEPPwh+NEG8eJvwzwPsHanRHCfVhgtSGhjn2DapUS/JemoBUQekBi/RCSYNsryRRmqr
	 Px+L7T86BMrkq6/CQ9YcNkwzfd2foFsYflafjpwfxPzLnTD/GWiB7uzrrf/9o4nAliw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inlimbo.org;
	spf=pass smtp.mailfrom=em572954.inlimbo.org;
	dkim=pass header.d=inlimbo.org header.i=@inlimbo.org header.a=rsa-sha256 header.s=s572954 header.b=bwPXhjft;
	arc=none smtp.remote-ip=170.10.71.186
Received: from a5i186.smtp2go.com (a5i186.smtp2go.com [170.10.71.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC58F606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC58F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inlimbo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em572954.inlimbo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=inlimbo.org header.i=@inlimbo.org header.a=rsa-sha256 header.s=s572954 header.b=bwPXhjft
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inlimbo.org;
 i=@inlimbo.org; q=dns/txt; s=s572954; t=1795036269; h=from : subject :
 to : message-id : date : list-unsubscribe : list-unsubscribe-post;
 bh=H/WlOzQPaGUcxDofm4SkODFhhO/r7lebnQiNEO6E2YY=;
 b=bwPXhjftGBx48D+mHNQlXQ22nFOpsNde2uT7V9iRT0vhGB8L+eJ8hFE8nqpx/Qb5D6m52
 C6H8o4llGhlch4VjR0zllYFAlmFPdsXvQ6X7amfXC4Y+c0nMPHg4QZGiPviOeOXCTeToTSV
 +3ZwT0FJPP5gpOswqZxupHBtOOFNHtpZBbRqXmK/ORrpidmPhRlXLRDo6RMViZfUFR1+Tes
 3shZwKYFnfy9U3w88TKLkb+/jWJCb96CuQYCoa6LlKHjB5DSAM4BKD0HLqFYCAx5U3tiIiZ
 ykHo7tJqnXx+naOQdU41b70QXcDPtbdX8JeT7DusmQZQSAkvgFMChye1+OkQ==
Received: from [10.4.240.50] (helo=franky.home.inlimbo.org)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
	(Exim 4.100.1)
	(envelope-from <blaz@inlimbo.org>)
	id 1xTmvl-AIkwcC8skKF-rKVI;
	Wed, 18 Nov 2026 21:11:01 +0000
Received: by franky.home.inlimbo.org (Postfix, from userid 1000)
	id F14AE460072; Wed, 18 Nov 2026 13:10:59 -0800 (PST)
From: =?UTF-8?q?Bla=C5=BE=20Zupan?= <blaz@inlimbo.org>
To: dev@deq.rocks
Cc: Yossef.Osman@proton.me,
	aditya.garg@linux.dev,
	arend.vanspriel@broadcom.com,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	=?UTF-8?q?Bla=C5=BE=20Zupan?= <blaz@inlimbo.org>
Subject: Re: [PATCH wireless v2] wifi: brcmfmac: keep ARP and ND offload off on Apple BCM4355 and BCM4364
Date: Wed, 18 Nov 2026 13:10:37 -0800
Message-ID: <20261118211037.11870-1-blaz@inlimbo.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118123933.74517-1-dev@deq.rocks>
References: <20261118123933.74517-1-dev@deq.rocks>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 572954m:572954ap6fYNW:572954s9s1FY5vC9
X-smtpcorp-track: UcSrLfFmSoy7.1m7WUat7-Anl.j3PjJw2omC1

Tested on a MacBookAir8,1 (BCM4355/12, firmware 9.30.503.0.32.5.87,
board_type apple,hawaii) with kernel 7.3.4-3-t2, replacing the t2linux
9006/9008 patches.

With TRACE enabled the driver logs "Skip ARP/ND offload enable on Apple
BCM4355" and configures ARP and ND offload to 0x0. With the firmware
console on, the "EL: 38 5890" errors stay at 0, idle and under a
6-stream download. Throughput after a fresh driver load is normal on
both IPv4 (260-301 Mbps) and IPv6 (248-336 Mbps); without the fix this
machine is stuck at ~50 Mbps right after boot.

Minor: the code comment says "IPv6 downloads drop", but on the BCM4355
IPv4 downloads drop too, as the commit message says.

Tested-by: Blaž Zupan <blaz@inlimbo.org>
