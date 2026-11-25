Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795576056;
	b=NiC+nXx72JZ4eOwli4Y631CxIYLg7/We2sC7Hd5PHuK8z8B/7DELIHIOOi+0YjVrG8+9
	 j3WAEgEhvSCj8TT4LSYscwhchMTd8x/iHf1LvJCJGl2waRaivqVFebqp0sSTRgeSbJYrV
	 MMaL3xQ04jmRE/re53hErfvSa55pObQj6+dhR+XsPx4S/BkCmWpXlOfPlGQje04AwKD73
	 gyzpCcInMGyarhttn30yjuihe8TGjYZKyLEgNFrJ5U47DWycjpKZ2j5KAgGf/cQTblC2f
	 AfvMER8z2OdZ2rJPBmI5aGHco31PAw2CpfmzlrjXJl5/2WcqhMxi67X2ulR6LlhY8SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795576056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=CUafj1yXhndAFrMHVKhryVJo/igZsYdELEkxAr8CdXU=;
	b=HF9KY4zkAw8jmNEj6kGNW66qhRSvrFY+rDu0ibx+NBJ4i37C9NyC6/m8tbcqQmBRcB9N
	 qI5rUAPmBjR0n9UTTijFv0iOd/111//LUdJ7pMhS04DrbM1FlNYAtT/41BuuJSdtWtiLz
	 DHfx3Y5ns6futwlXIqMioO9WVcRZVMH4Gvy00WdyglqbXRLf6PDolqQg6OrYLq8ya/Zvz
	 +oQdZVZGsGxMkKZXTQQsbiYQY/Jp1gtCRhfSH8sdt5rFJM1wUMvyPjxwN9aEA1aV1oEGL
	 1Yj2ICEbVW+TzUZmQ6Q9U9ND1Ac7/IGCpmejzIm4yrAnVRsRt5tDdxm1iQMqjXY73Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=DoKos0t5;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8160606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8160606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=DoKos0t5
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c516a194350so343202966b.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795576054; x=1796180854; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUafj1yXhndAFrMHVKhryVJo/igZsYdELEkxAr8CdXU=;
        b=DoKos0t5g7Ky/m0BUA8mj3mrpacfhJ7ur5p3xnhfCxjYgq6lUs+9IE/Dxyno5laH1W
         /xVxsZdWpdcKfX1r648QQHl1556rp97VemD4bRlWqDwHU32daV6rNLxL0TcrjJdoa6cb
         4KhLCS/mxi8ka1YGA0uOuuO+qIPY+3lPeZa0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795576054; x=1796180854;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CUafj1yXhndAFrMHVKhryVJo/igZsYdELEkxAr8CdXU=;
        b=C05ISZF9vNR9t5HukwExn6c5YEd7ME8vffjg5+IsbKe9eXfdyFguCMuySVM2Lz64NN
         9NqP18ImtHBa0tk00CWUZMDKNHRp2xjC4/1w7Y+ybICzpPpap54J+2WG69VLgOi4x6eb
         FgAY0bv1L5bYqp/WXqXtdbLvQeV8qg9pykAVZoQF3lGcmNtD7VOQ/6ZHSai1c6nNkF1v
         qh9qpoxb9+uBlueCoyBxDwpTbftKOTz8lpHnRt5p74X01fdjbPBs3+6zaEtvrkkDrLEY
         dzbyaCMX0wdsgUEWCB/1k3WYn6z7LaqeT8KFxquaQaawD1mieje1XIw91UD16w0tiRjI
         oUtA==
X-Gm-Message-State: APuU4Z+9FjIKp3KNy2etA3l3UKgUawA1tnuSIS2/eAn5hIyLg1SsCIQX
	oHiRafIye+sjc68X5JQ1IZxuSKxNDNyvduFwE+fcVfEahXZq2K2nEFpqM0vMaeJK5uPisCidaRU
	lInyfNOn8Mw==
X-Gm-Gg: AZFdTZfOYoFNRMrXrt5orOXlsTj8ArfP1nIKPmE06EkEnq9FBL5t6tEPTAmiT/AuSVE
	SZa2SzxBYYy0kdE2qakiXZibaLyjYYYjYGuiCMQdx8uVfjPbpdbOFIPMyn4bPBDbSelPNUf2YZj
	S1LDUZE+daOVmKlswAeDx5uubuOGgWrbSCi85+X0gx8rC5ZG8a/Sj8ZnE94/PbibAOZSMykyxtA
	Vcsr19Th+NSs302qdxy6Njdpdkee/cN3ETNuqEhnow/uSlko7BgrrvPXjzxTKjlF7uVJnNoPwDS
	YI2qMSUlHahepkVS7Wq32kHE2vEQxRDyXVEgxvByBIbTh6ZNFbV900v1snyF6HP/5Llq7sO8SKE
	g64DQBFvyevaIx8vfHePVZa3poet/ep9SjTOYlVZaCwl70fPwlkz8000WUsrV4vwMHXwLzkdTQd
	ZuaRJQyMJcu2A+cVpHajqOGBIPGTNWqPlsPRrA5Nu0kjo4FGmtvKHz5R5QUI4Ug8vLS3BOzYKs0
	3VenxkBxwM6u2rxJAW2jtkGQG+7aXn3Co5rw1k9S+KH86VdFkVJGckZh5McdQoStYOYId6hSpNH
	0SHDbCwIesYp9UQRemNd8iADXfyCd/UDXbecb/AqYZNLoU35Mc4DQQDG7f2fBFS2hnJsquyZnOB
	IEwc=
X-Received: by 2002:a17:906:5d9:b0:c41:4964:90b6 with SMTP id a640c23a62f3a-c513aab025emr1058134366b.36.1795576054133;
        Tue, 24 Nov 2026 19:07:34 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afed607sm582017266b.77.2026.11.24.19.07.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 19:07:33 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so8949693a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:07:33 -0800 (PST)
X-Received: by 2002:a05:6402:274d:b0:6ba:95c2:7512 with SMTP id
 4fb4d7f45d1cf-6ba95c27b99mr7047608a12.12.1795576053551; Tue, 24 Nov 2026
 19:07:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <awW86EI5fYafQx-o@mit.edu> <CAHk-=whyUfwzMDMTpih8Xs1MxmhwTCDAc_YwUSZG79vXFMLU=Q@mail.gmail.com>
 <awYonzw5rsvf0cnZ@mit.edu>
In-Reply-To: <awYonzw5rsvf0cnZ@mit.edu>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 24 Nov 2026 19:07:17 -0800
X-Gmail-Original-Message-ID: <CAHk-=whFaGFFcyyWXvm9NEUchjhRHSa7LbB7ki3SzWKcRx3xJQ@mail.gmail.com>
X-Gm-Features: Aa3M54qFs9GPvdo-tQgVAcJ0Pp0N8DDqDCwWF-YWiFCYZYqnp6OC8FnRyFwqSiM
Message-ID: <CAHk-=whFaGFFcyyWXvm9NEUchjhRHSa7LbB7ki3SzWKcRx3xJQ@mail.gmail.com>
Subject: Re: [GIT PULL] updates for 7.4-rc5
To: Theodore Tso <tytso@mit.edu>
Cc: Linux Kernel Developers List <linux-kernel@vger.kernel.org>, 
	Ext4 Developers List <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 at 16:21, Theodore Tso <tytso@mit.edu> wrote:
>
> Yeah, sorry.  The tests were on a separate branch, and I deliberately
> put it at the end so if you had objected

Well, I do kind of object, but I did do the merge and while the test
infrastructure changes did cause conflicts, I don't think it's worth
undoing.

So I've pushed my merge out. Do check that I did it correctly. The
test resolutions look "ObviouslyCorrect(tm)" to me,. but I didn't
*run* any of them, so they may be complete garbage.

                Linus
