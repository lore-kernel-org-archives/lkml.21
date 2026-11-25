Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604809;
	b=4YTn4jiPFH6P2lKHyKntapnSWYM7QLeHNuNrm+JEu3bwov5TkcfuSkraf67xVvFoKxJo
	 D462NwV09rHy9jwtMgWW//7Nhex7ll657/Wrw+yUJfUkcZAwsZajL6yiF5kkDlzVAcTLm
	 ucTZcuPH1FGQttWaqS4lz6V7z8UxJX5hFaHyX4RPJRjeXIJtVXk0en3hq8491lWuwkXzc
	 fpvc+TWeDqbro/9OyFkTw6HyNGNEaD3D/NcSfZSMGQA49oHaMrtWCbTQ0QKyaKLClfbGX
	 oQs59CAcL8YC9vqfVmuA2pLX6NqJK0hUnmU8cE67HJ3OTyNh0jQhEI4YxlcM8vx9+Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604809;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=CC1jwJWwdI454y7ESWHR3zHzYlpHKlOaH1jugkPLgTA=;
	b=IOtAO0539gLYh/ydjnB2REjAxwXImmOlbsGX4QLMOkeNO/EKqWha+swgjlR7Dd+qFOs8
	 unS1TfotPz1rJc8/QHziCY9S10xIvi9mqpyifKcQXFHXVyTvroKcGth0dNTffbRQ+h4vf
	 5cLdl0rb5nD+zute4KU5rXLEQk0dXb6i2fthjhJFofsx3KoWw28svdPR57937Al93EPzY
	 g264+bS6aZ3KkwxYYhCGSfV740OAkQhGhRdo0PW5u3U41gga0jsYe7U7KAaV6UwZnYcoj
	 zpoXrjmDMUwIp+xpZQkxaq8JKjT2uk8PqdPWkOXPchz2fYgNXgpMe1a74WG7UwGvJOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=fMGKjbRh;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21DE606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B21DE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=fMGKjbRh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=CC1j
	wJWwdI454y7ESWHR3zHzYlpHKlOaH1jugkPLgTA=; b=fMGKjbRhsXU3w7WCzWvR
	jDMwCDbDltuKrAz49M+eHGT13cQ+BowtOyhdnUbwFfj+NQrLxOMxLY+6BpmxN6g+
	e+hQDQiz+ZpuLIRuqn6//bWLd1pg3J6Y0H6rx+Ke60vBNEPChA/jZq4wi6AuxdqJ
	8E9763PtVJFG92FhAa2JGFAiS6uUrlC8TR/riiDT1x+PyXycWY6i1o+VZ1GZ9j1+
	ijbXXBjPpojvTdN//jIAl3wJCFB6vLEXCvDUD22Zav154zel+alSFIH2p/iXItuz
	3kCnNSQtjAe1khan/2tDK9ZqUmKacAWqwHv6CU7zOUjwdtOB4i60/gcRrT6W2Cz6
	NA==
Received: (qmail 892782 invoked from network); 25 Nov 2026 12:06:45 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Nov 2026 12:06:45 +0100
X-UD-Smtp-Session: l3s3148p1@DSmP0hdhdJcujnvc
Date: Wed, 25 Nov 2026 12:06:44 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Yige Jiang <yigejiang86@gmail.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Wolfram Sang <wsa@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] macintosh: therm_windtunnel: Fix i2c adapter reference
 leak in probe
Message-ID: <awbBRG6VMVKn0Dor@ninjato>
References: <rc-b1-20261110-vc-23-41d00428efcb@gmail.com>
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
In-Reply-To: <rc-b1-20261110-vc-23-41d00428efcb@gmail.com>

On Wed, Nov 25, 2026 at 05:03:43PM +0800, Yige Jiang wrote:
> therm_of_probe() walks the i2c adapters with i2c_get_adapter() and
> drops each reference with i2c_put_adapter() before taking the next one.
> Once do_attach() has started the control loop, however, it returns 0
> while still holding the reference to the current adapter. The pointer
> is not stored anywhere, so that reference is never dropped. This
> happens on every successful probe, including after an unbind/rebind of
> the platform device, and the extra device reference would make
> i2c_del_adapter() for that bus wait forever for the adapter device to
> be released.
> 
> The driver does not use the adapter after do_attach() returns; the
> sensor clients it talks to afterwards are children of the adapter and
> are unregistered by i2c_del_adapter(). Drop the reference right after
> do_attach(), before checking x.running.
> 
> Fixes: 3e7bed52719d ("macintosh: therm_windtunnel: drop using attach_adapter")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>

I require tests on HW for this one. Windtunnel support has always been
very fragile.

