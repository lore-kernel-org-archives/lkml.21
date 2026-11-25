Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600296;
	b=uXIkD6D4PJhmbFAkcAqgU2nr4Z6JtOWBLDL4ztlHvlaVu6m6SJq59CNnQbj3IY9jQ1GF
	 U+FSH4zSReJxulZFK3I5j814mI00oHUotSH0aTmBxP1QNNyJqRfsz4XKun50l5JDfsJAk
	 uvP5HEwH59cY//jL5G37ZET/6BE2q3LSxJFFhUJgfIeAa+pVI3uB6gWq2SrJxWV68oApa
	 ctweQDdUzoTRKwK5B4oRmxcCxMdR0seFee0nTdAW0HUVMnucumtHWfPQENj2yyu+gWyhS
	 5rB8HpXwmGMq+8GNBbHJalHCntKJvv8kxrLFFWRevwKExi0Nug4eQQMyOCfsaj4pHVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ExEdfB9WwLHoUe7nHSiClkfqem+8Ndsrh2CmQFmZ+3c=;
	b=ne/uGPoaIq3BE+Vp/oElHz7/ykmdpSvJPh5xg9iYpXxkYCtMjeP3v9HPyMkIeVVkDl+t
	 V29AXYX5bK0DMvteNhD6FldNySL597sfeHW46UTkQP3sveM/fHleBAtYSP8ovhj/wX9cz
	 4u4anxm+JQSWaNJ3BR98SGRgO4iCNsg+67ZhswykHfT/DtN5I9cxHzCIR2BwcXF9wP8ln
	 RX4BHeP4jCsnpv7qDQcbdpo4kSZQ0Se/1Z9Io8IivWc5QMNOgQ2R0/ELUjD2kSqOlVsQ6
	 t9t28EeBa991QM2/+TqJSAag/ftWtwvTf6YCv0kMDMcudP3xbji026Yh177cqRdSJXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=ZOTq6OpF;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E01606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56E01606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=ZOTq6OpF
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so4256558f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795600295; x=1796205095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ExEdfB9WwLHoUe7nHSiClkfqem+8Ndsrh2CmQFmZ+3c=;
        b=ZOTq6OpFmLPEfwnp9q8dUA0AGMbQltxU+d0PUMHlX0ejPnYg8xRfbNG+MkMuq8ouPF
         5RwWDOgzMMtcvTSE1C/hLlzuPiUQZYX3PnnJM9OCcyC4YCghxnmn2ED1I7REeawXpTCc
         MyodRJH3uu2ySM5gCJ/RnduJiUL0Nhy4hv+PIvQmV/D1LKJfK2K6YOZlhp9JNcVh5a2t
         LEDl9PGb5xEqTHmHMEv9sbGjoXm3iZeDTi5n+DkZ471czuXyZ1YJfsLVhMxtY1DpivDr
         iRWqJ0kdppUTHXR3FCsll2AVQl7nQYqA+aC7/G4RW9Ncsk96ZIwgi+Vay6i6h04XGVfy
         /Vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600295; x=1796205095;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ExEdfB9WwLHoUe7nHSiClkfqem+8Ndsrh2CmQFmZ+3c=;
        b=FepDON+2qk16dWKsi2pdVJUOw1VreMCsOWG0UbOb9s1gNCeYi5ihv0skE2iWeMd6YT
         69sjcy8WGNKoa6+QJbfisizrgIdwTWqnwMJ+zu+CC7nZ47hqRwmD3q1k9qU22xLbj/99
         cXDDRqxy3QdyhOHTsZKk1gCfAY0DEQrhEMh5xeKE40I2xDOaAFF4prvHTo54/nx1SIWN
         QYKCHlCT9nYVrmTQ76wImZ5ZjebQi44WuGuCyh6UNDbTC2O2tZ15RYviZbDFOEeUF2Lh
         WNoe3OQeLvPPWoD37XT1q+YDtnZguzFrnPQOfd7wNsDve2c8xQQ1IOMljN8qUuPAAle4
         xTWQ==
X-Forwarded-Encrypted: i=1; AL+hErE9JSwpw+HtXJAifUno2SypUlvw6yYSb66BCQxWyS+u/AK8W8f+fdJDX/pCqUdcan0Jkte6f4EapBYsMGE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Tv1bWfb0SpxmZhSQ4Vkm3fsjMdLCy5lInl8D9ruN0/K1JbAkV
	rcVL8XBsPNEeIUyfRxdBpAgq7itiIW6xoa2uftX5NO7SRqLCYmlRp4GKyJyfAsuZxxQ=
X-Gm-Gg: AZFdTZcCQboWkZ1pxInpEUNzbvBYPi+SnhWzZxOMXwxbVmdmi2GoZAI9oZ8FgQsfdcI
	Hmix+r3g+QOvUbPzm+782N2BdcCafzRJARj7whRZeEv3/MYbTD08FysuhHrw/C2CENJT21jZ9df
	36lq3QuBkwyhz7a3aLgOdtP7W/MKXa1lAQYufl2J/6Ax7bAN3Fkmx+UyxBcmyiHZIoO8jrBvFvO
	yVmsB/fXnbfIk+X09hHZbcx497FUtC7m2x2QJahqG0btMDoQCU+vQNeRtARynpNjkE6d/c92Anw
	OFC9GGWKJMn83LypUOIjuq0zOYEduohqw3Is3+abyJVX5csTRC8On4tnG/BaON8V91Old7w6Z05
	INA3Js3PJ+JnCzfVjIhNV0HglFniYmkPMhJTDJ3+IutY0AHxEsZEiKXaOYEYOt+Hl9FLvZJiEm+
	cZnzDB75yA9aNfUL+u/vYbS7CS1BNI6uVncJ65+JmuuNWCfpQ4TchJ2b9/Z87wk+QMhBUY49LxD
	jvt/NQn/m76y5ImpGXiZPTHqVjgF/m0VTIBZf2nT+uvtakj5GcpYaHvgjqnW7zANbZpidoy7No6
	90sAz3ug3Nix4pZNhZs=
X-Received: by 2002:a05:6000:4617:b0:4a9:760f:1824 with SMTP id ffacd0b85a97d-4abb19c153bmr33040480f8f.21.1795600294485;
        Wed, 25 Nov 2026 01:51:34 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm32867213f8f.42.2026.11.25.01.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:51:34 -0800 (PST)
Date: Wed, 25 Nov 2026 12:51:30 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Christoffer Dall <c.dall@virtualopensystems.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Sebastian Ott <sebott@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	James Morse <james.morse@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 5/8] KVM: arm64: nv: Replace a pending SError when
 injecting a new one
Message-ID: <awavokPJT7G8J2fX@stanley.mountain>
References: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
 <20261125-double_exception-v2-5-224689d8a764@pereq.eu>
 <awaVj0Aa6dMSksxX@kernel.org>
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
In-Reply-To: <awaVj0Aa6dMSksxX@kernel.org>

On Wed, Nov 25, 2026 at 12:00:15AM -0800, Oliver Upton wrote:
> Hi Dan,
> 
> On Wed, Nov 25, 2026 at 09:56:20AM +0300, Dan Carpenter wrote:
> > The kvm_inject_serror_esr() function injects SErrors as the name
> > implies.  The bug is that it doesn't handle already pending errors
> > correctly in nested virtualization.
> > 
> > In vanilla KVM the kvm_inject_serror_esr() function always sets
> > the SError to pending.  However with nested KVM, it might set it
> > to pending or it might deliver the SError directly.  We can only
> > have one pending error at a time.  Imagine we enter the function
> > with an SError pending already.  In the current code if we decide
> > to pend the new error that's fine, everything works.  However if
> > we decide to deliver it directly then the pend flags should be
> > cleared but they are not.  So we deliver the SError directly and
> > then the SError that was pending on the next exit or entry.
> 
> I could use a bit more color on how we got here. From what I can tell
> this state is only possible if userspace changed the routing / masking
> of the SError outside the context of a KVM_RUN. Otherwise, if the SError
> is deliverable on guest exit we perform the injection prior to exiting
> to userspace.
> 

Yes, but the main reason is that I'm changing the way
kvm_nested_sync_hwstate() works in patch 7.  Now every stored SError
stays in NESTED_SERROR_PENDING across handle_exit() so this situation
will become more common.

I will include that in the commit message when I resend.

regards,
dan carpenter

