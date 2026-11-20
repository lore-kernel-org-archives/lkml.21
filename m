Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134681;
	b=oAhKda7SZZIf7O1OY8QPg6r/Va/mOO3hfDmrYXFC1PdVQaSzqMR65qE+VZRtXP9Ow+hr
	 OCs49PbCxQ0hRa0fs7lShwFfjjNx5xXD9gMWddfIW3TVo+dfsgGpWyoISg/KyMOk5gAN2
	 tJj6tq8VhD1JXtxljhir7q+KgboozsAfNdSAq9LwJz4d2MD3c6o+8Z5iiOuH9/cGQLhqX
	 yRd4g/E2ld93yJMk2aSd31KNRfyAU7+M3u11u/6UX3ObQIG/HTxD1b9dusqoTNN2K7NR6
	 4uHh+/V2CkHmTiuXAGtweusOxU1lMumYOwpEMlNGdlDA1JJxzhHXoRAe2PaaPOMST7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NJvteZs/7UwxXTsKI+K0BOVZAwYmYsNEfR3sXFomPaM=;
	b=YVBB9iMWfGGEb4NuinxJy1Rn6FaHILlHQo4VUfHkB8/DnKiYJNIXJU2kbQmb/GszVpYQ
	 Y3R/BPMY4g4lo9mJxm9PbBMZZ7J9R8t2iVeOOCpyK/7uvk3Zxsk89je5Cpky7Kq3UfSTo
	 6oGkkJKnF3PWXX8nynfhtDTXJ5hwqKy+7M/tY0jEeNDmEDwnBIZefunh+9RXAzYarY7DE
	 7R0oDlsTT7v8jFUMlS6hSdF28PhWsNXjaDiLg79yK2E4GnTzt3yCdH7Ietyza0Ye2DQ0b
	 IIG68XOrTROW+kk8RnFY4JqhY0EiyBl+HhNJyXtqztnsOY3COeRFNcJ8dZng6WYUBLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JtKGSFFu;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1274B606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1274B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JtKGSFFu
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f0464dd6b6so57965ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795134680; x=1795739480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NJvteZs/7UwxXTsKI+K0BOVZAwYmYsNEfR3sXFomPaM=;
        b=JtKGSFFuZ37OqBXPbDHC1v8kICm6XKkcO5sFrHNQM4ceEFl4ENKQ66mtQ6mD4AyZNY
         U5vZo3qQm2BbdPVp24dPvclYKKKU1gbAtsICRk6SeO9YFUOgAczmBy2Om6Lt9vK/OYrm
         y1kLaGumQITlISvqdrmH84JEcdiq0Rb81AAURpGYrvUxfWKGnDccij2EtTG722TjzC/a
         0ZRxvc3jn+fsFnGSnV1gycG8QtUmUq9C9OZ904CxWwD5AhVJ3G+gb/TRIDBN3JCyYqdl
         IybEUtBNhGYaGVB6OWt/Y7EKtv/Bv5sAwX4p777McHQtKOUnToTmo3Y0tL85sLK9M/Py
         KzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134680; x=1795739480;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NJvteZs/7UwxXTsKI+K0BOVZAwYmYsNEfR3sXFomPaM=;
        b=BCU+xDSqbJkh9pJEjueunTIwxtsihfsh6hzRa/77H8z/V2l502ivR60MyJKOQqieRl
         ZOYsqogrYz89rpa0Vzc7U0ds3UMBrqfj7zvVpHpcP6Uv7nBejJGk70gEFrawJQHMNSgi
         kQA9SxZPcwsL9ECzSXvjupVM5ONTUpJQAmdMFfYuoUO2bovrswDgGWzfOPFvCN6oimIh
         TG0NqlyfUMOrKQmc6xcZzq6I3kTkWTqjYkG/riE1FlYWVcmtV9etK0dvs5YAhqHXGJmZ
         kMW8yoctcSXl7asKlzg7Ji8x45dzRXVXMifap436qx4s2FVtifbmbu8hmSJwhYLJmhh9
         dmqQ==
X-Forwarded-Encrypted: i=1; AL+hErFNpHYO1s4Cys03ErTrA+nY13kPbeg9e80wcyrVvuFmY0y8Cy+xx0qq5lHBh190q42m5h2WTtAnk8+QcDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z842sHE4Il9mugICfFDuVnq4Po1Kfwuyv8VaEOHnMhEXXK+wYTu
	9WoTYqJj2d1hpgUJyi/EuKGiqlI97ZXdAmebXWoq10nM00Wfb9BFXScpHNpk4QiY0DU=
X-Gm-Gg: AZFdTZcoprQrIiaMkVbRyso0C4hC/FWYUC0nOoAJz7ssxzsC9/PFZSuHWv+Za/nzlMv
	LHZAXfgnouRr3yxt4JE8YViaw7VessHtlOEcX0IbK0nKXrBp9YG7/mk3oZIG8sS1NxkXjlLl+fa
	A8DJ/9Na+A4EazcsQvfuuIOSjtFDVOHZT7gjPY+tN7K0TPlrV/N/u86qSwRNockxM092DD3TSOi
	Ep+VPCqBkEmh7SCV8PRl3sKJAMpO8pEFzZ/2OwoHBVuMJlZMCgJz9OdX+kvN2Wc2fauqvSiiNfP
	s9vZtmLHa3bG83v6+aYBLr4xfc430lIMrgwo4O/JDj4JXaOac+mAABcf9AUGEfT3YprhJ6L/JT6
	yUgL2fKcK6kJ4zsdBarMUzdDDezWFNBl/5119uut7+UPYxoK8I8KMpSU+bqC7o2S30P8eIj5jXM
	9cd17NR+1zT50ykjA+aTzTn7eK1xzX4HqFZA+CPSYy0cp536qfl8+md+s7En//NmLM5+4serKUC
	U8P8qnBHtWI/UPpISUxnfIMnPUVhw8DS6lIjmhB5LxNkFCNlENHFtD3QABM2012Zi1wlSV+UZr+
	1m6wK5Mwvj3rgqMCFbBYF+8M29jOM+EVa5VwnQlwnlc=
X-Received: by 2002:a17:90b:390c:b0:3a7:9e3d:b3 with SMTP id 98e67ed59e1d1-3b41c9beafamr876819a91.66.1795134680373;
        Thu, 19 Nov 2026 16:31:20 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:55::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad47091sm1615819a91.10.2026.11.19.16.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:31:19 -0800 (PST)
Date: Thu, 19 Nov 2026 16:31:18 -0800
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: tariqt@nvidia.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Subject: Re: [PATCH net-next v2 0/5] net/mlx4: TX helpers and deferred
 doorbell fix
Message-ID: <av+U1gCrKGy+SuGU@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, tariqt@nvidia.com,
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
	linux-kernel@vger.kernel.org, daniel.machon@microchip.com
References: <20261117155353.2250540-1-joe@dama.to>
 <179493106742.3291.11434436383058043225@kernel.org>
 <avyELebAXqr4y1Yi@devvm20253.cco0.facebook.com>
 <20261119143852.3bca9000@kernel.org>
 <av+HfZSa40OFtF+M@devvm20253.cco0.facebook.com>
 <20261119160559.45b9fc7f@kernel.org>
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
In-Reply-To: <20261119160559.45b9fc7f@kernel.org>

On Thu, Nov 19, 2026 at 04:05:59PM -0800, Jakub Kicinski wrote:
> On Thu, 19 Nov 2026 15:34:21 -0800 Joe Damato wrote:
> > On Thu, Nov 19, 2026 at 02:38:52PM -0800, Jakub Kicinski wrote:
> > > On Tue, 17 Nov 2026 08:43:25 -0800 Joe Damato wrote:  
> > > > The only fix in this series is the deferred doorbell flush (patch 5), but I
> > > > need the other code (patches 1-4) for SW USO support I plan to submit next
> > > > if this series is applied.  
> > > 
> > > Not sure if this is what you meant but this may read as if you were
> > > sending a fix for net-next for convenience of sending more patches.
> > > To be clear - that's not a valid excuse. That said, here, we're talking
> > > about a 10 year old error path bug which nobody apparently have been
> > > bothered by. We don't have space in net for such things at this point
> > > of the cycle, anyway :S  
> > 
> > I'm probably just being dense and not following what you mean here.
> > 
> > I was looking at a local branch that implements SW USO in mlx4 and it was
> > getting to be quite long with a lot of patches. I thought that breaking it up
> > and moving some of the patches into a standalone series would make it easier
> > to review.
> > 
> > I suppose you are saying I should have just kept it as one longer series,
> > instead?
> 
> No, not at all. 
> 
> You said "The only fix in this series is....I plan to submit next if
> this series is applied". Which triggers my suspicion that you packed
> a fix with -next stuff for expedience / not having to wait for a
> net->net-next merge before you send the rest of USO. I don't think
> that's what you meant but since I had to ping Tariq anyway I decided
> to wag a finger at you. 

Oh, OK.

To be clear: I was not trying to circumvent the system or the rules and if you
(or Tariq) prefers, I am happy to peel this apart and send it to net in the
next cycle.

I am not trying to rush anything in; I'm happy to wait until the next
cycle if that is what is preferred.

I included it to net-next because my perception (which is clearly incorrect)
is that net is much stricter lately and issues which have never been triggered
IRL or reported by users may not meet the bar required for net.

I'll be more careful in the future; I just legitimately did not think this
change would be accepted to net.

> IOW I'm commenting purely on packing what can be perceived as a net
> fix in a net-next series.

Sorry for the confusion I caused :(
