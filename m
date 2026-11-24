Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795481292;
	b=DJWSP3qYI1+gyMB0UXPUtxUShfUKTMMv92vMPzbXBozZcJRk9RWpcUZi9yim1FzJKZBk
	 mxVti03TTm0jAela2inGUWY4Hse34VTOF3afu2RGZaAxvJIL5WOhSWolF7DA1VrhU9NQF
	 pNHfvUe7qVrEzOUnAGfPnYIDJFXsvC/p438mA/pOGSnuPoCMHGXsu0q5l/8qS4kDcW2RG
	 LT9NVOHGcdu7veJdzJkZYXcbdipCIWQMCAW73XDqxVxrJdGFJTWJu+fjSFsi2opXEgCg1
	 Pb6qvTfdRB9KO6G8MTgWRbqWe/58a9VWEts5MFqSOQ8+JWyPEvJ45SXSeGgS2hK4v+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795481292;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=AL3M9vXZtiNj6K0OBpGxfbf8/UdIY/HNWl03x+2qoFc=;
	b=y2F25xaI9hQOMXt97DV+v0Prufyqd1oH9ZjWmXmFj/Gd1wh+6WQSZm2RY7nVeMfitRHX
	 39w7KoRtOq2TZ72VvvWxultilhp8ocKCB3Hu2/uYy+46g/zDIdABytkzs1+5vf80lWaf6
	 JFGWVNH+R0ENdzMqMVJzmwKJKJx2tk/JzHdzcqUQLOynUcbGRrnR1jFWLoqeyD8YiOCjC
	 xb+s43XRvI/NmWAhsMZtGS6JZGtZ/EvfLqWRuPN/H7oDodGt/Ip/08pcMrXiaVUM7iv97
	 HETCLRiF61qsqvEjjVx6ZF3HQHmJzhL3GnA2Vww5BT/6UM0iAg9g4CXMrSAPxIFFgGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RHYciRSZ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bVkV+8uh;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C449606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C449606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RHYciRSZ;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bVkV+8uh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795481290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AL3M9vXZtiNj6K0OBpGxfbf8/UdIY/HNWl03x+2qoFc=;
	b=RHYciRSZAvo6KRHxNFzl1TP+H98aopTERJIcvoqIq358qq3TALGJGvKCpN6JWOLoJAAA3h
	dn6I66ROYTBoXJFxOltXEePv9Pi1TRSDyJvuKGjFep5TszpTK2qGkdrkXjt067HbQ0GMa5
	nJwPWdBtLU8mfZ71Lp4Pb5OpDv4gJOo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-_gtbY6eLPPCPVRJL5vwCJw-1; Tue, 24 Nov 2026 00:48:08 +0000
X-MC-Unique: _gtbY6eLPPCPVRJL5vwCJw-1
X-Mimecast-MFC-AGG-ID: _gtbY6eLPPCPVRJL5vwCJw_1795481288
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d33f412b1so76904061cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795481288; x=1796086088; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AL3M9vXZtiNj6K0OBpGxfbf8/UdIY/HNWl03x+2qoFc=;
        b=bVkV+8uhhZ+Hij+qkhp9Hj2u/gOjKhvw6cnvyETmhNATeN+hqKGaEtVJ52ZW3uS5Nk
         sGgj/a/zIgDnaS7VTQl5R4DImOVIupAgMlthxiLjRbWet8uz344alzNZqIu1XDDRJgCU
         dRwgWtJ19XXchFjUqSiyfCwuTiF4cxv87fwoF+hpoLrV4dXviRknwLWA+XlMvPueHpH8
         M6E3XhQ3sR+budG1z4cexIUAOelmRXoI78CSf07PZrPoHHZG86tj2QozMF0/3wnpHWJ/
         27HhseFm1xNeLPRU5N/nCKZ3CgNDbmCLlbqTIu4+D/GIo0Pq4KYu/9BD0kvnTd2a+A9H
         9scw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795481288; x=1796086088;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AL3M9vXZtiNj6K0OBpGxfbf8/UdIY/HNWl03x+2qoFc=;
        b=awatN0jzoxkbmH3LMhdUpWsNSQ9kabaqXTPTZMXruOyHbIU6yvPzPE63zGeb3+Nlhc
         Mjw4tVByWFl1ottFTqs1w4N8E5rwKbPE/ebcvASBE2u5ano6cbsO95byfVxGJKtRZOsL
         vSGMGOkTejrHI23MSFPa5vvU4CEZ+ztknpHtCVOBW9PL17oJ2pv+iPdIDYETqZ6itLeC
         rQsUhpzk38SgWYwQQQLK2BxAay3QOe/xDARpc+S9I7u7HaY1lxs83aGa+O12FE03+hfC
         /EbhcgiKDdpeeXdVw+1DaKi3W/Geo3VFUQdCvLk6J8k853puMafUeB7Fx7tDRuU68QJ8
         t/tA==
X-Forwarded-Encrypted: i=1; AL+hErE18k5fMflLbSMZ4lXapLN9zd6zkRU+TAWFHTDon/qTNYG0SpgfiTvEb6NWjpnsngNF/u9p4FjFoCl74A8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/A6q1CW+OlPOgX0R9rZeePhvpWmkOnmlw7SUte5Bi7v3NWjr0a
	0woZy7QaIetXlXyf2UgaxECvdQg1ksBdSz+DbCDV0wXCE+mhbD73HI/z8LMPrcSbFTD8s0lar2G
	kjgcaPLiIKf/LKOtQw58qi/3pxzzSbYDhX1/u6rkhlOrr4jaxkO8C6LmFvoqvfUgf2Q==
X-Gm-Gg: AZFdTZf50zSFFyyI7D6YOrDau/ECM/cl58FHHF7YTDU8t9405BMR/5ZQ8kjO2wb1WrK
	2K2LSzuDoEFmbj6fAWyCIGPZs2sZrYuZMATbNj1bsqum3UXDxkFYoKP6DmlmgFaRv6ecPcJ0Dsf
	OyUuCbzDw5ZhOebTU2j226bSjJBc29LRg43g5tLMELRpIEBAIz6ODG99IhK2QDkev5exK/fsLS2
	GQk1nsgGmvoGgS84ixEnl3f8IqMAr17b2Aoer935gZXmgnEQdVS0s/MBRRe6oz8VU8sx/Lw7fsM
	jQw2cVaNssPphbKttXF7fGyzCG2yPhhmco99HVKJACbuQIuELsqpfsz6LrgRwXsieiRmvqCzJMD
	iBZa0NPUx54ist4RDYBT1m9qB8W0LmiuLRBxN3Sal1Pr5xagnNgMMdbjimzvehEWN2vrQD/dvMJ
	HX
X-Received: by 2002:ac8:5e53:0:b0:535:a5fb:645b with SMTP id d75a77b69052e-55d76aa5cdamr256006661cf.70.1795481288305;
        Mon, 23 Nov 2026 16:48:08 -0800 (PST)
X-Received: by 2002:ac8:5e53:0:b0:535:a5fb:645b with SMTP id d75a77b69052e-55d76aa5cdamr256006211cf.70.1795481287752;
        Mon, 23 Nov 2026 16:48:07 -0800 (PST)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882e2c6sm114665611cf.12.2026.11.23.16.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:48:07 -0800 (PST)
Date: Mon, 23 Nov 2026 19:48:05 -0500
From: Brian Masney <bmasney@redhat.com>
To: Joshua Covington <joshuacov@gmail.com>
Cc: masneyb@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com, andrea.porta@suse.com,
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: rp1: allow the clock provider to be probed again
Message-ID: <awTexVwV2Mu8u3lc@redhat.com>
References: <179545567027.246915.947299820828330388.b4-review@b4>
 <20261123233827.61587-1-joshuacov@gmail.com>
 <awTd1OGm3Munmah9@redhat.com>
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
In-Reply-To: <awTd1OGm3Munmah9@redhat.com>
User-Agent: Mutt/2.4.3 (2026-10-09)

On Mon, Nov 23, 2026 at 07:44:04PM -0500, Brian Masney wrote:
> On Mon, Nov 23, 2026 at 11:38:27PM +0000, Joshua Covington wrote:
> > I'll rebase on clk-next and send a series with your change, the tests
> > and the clk-rp1 patch. How would you like to be credited for the core
> > change? If you add your Signed-off-by, I'll keep you as the author;
> > otherwise I'll use Suggested-by.
> 
> Sure...
> 
> Signed-off-by: Brian Masney <masneyb@kernel.org>
> 
> If you end up changing the core patch more, then feel free to take over
> authorship of the patch, and just list me as Co-developed-by.

Also that's going to need a commit message, and some code changes, so
feel free to add yourself as well with Co-developed-by if you end up
listing me as the author.

Brian

