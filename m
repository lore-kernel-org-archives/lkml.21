Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013259;
	b=sfAZlkppuX6XHCxqeDf+dQCnyAxJvHC1ulKg8s98jWYAvZ18phFNrIXPjxD1sSr6/yU1
	 FVSxtSP3ni6jXmDuSFmyzWMajacvQlXPNkXKsx7kRG2gLYn9/Hfkiz97ZgI0imr5idzVi
	 xHOiCofIf4eEVg8nplGO3NGZXI3jcNsfvDvdg1xb/JGH9xOqaCFNwldipHVo2JkcSxl83
	 Dh/8WITdJHmqzI3QXdcS39hUo+/FL7nizy24JsUATMLb2TW8hPs97QGYydqbOQiL2fgQL
	 X8i68pid0xcm0YrkDr982KqLQYppmcPDWqxk2GYnr649D3ST9c5fC03O5mdWMLQXeDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IgtmGgLwdp7YHZZLZXtmuM3LeEAEVVcvQiETOOFbu8o=;
	b=ycpArFC+upkAqseB9IQ2/K4HcXbRRtCNWTsqFVKSX8Dt0+vDiB1hAeNwFZA/cAjgGzlL
	 23UEfhogGlOmKp9LIs/RIP+bC6hx3b4XdMsYKkVp6r2Z7doJu+stQCYJK3y2T+YaJN5QK
	 K/VmsZF7OoyON0KK85NtblqQAYLICvAFaL0ZMxED5ikmJSfepOOhfdRPQ0Unzfbq/VPIR
	 RxBklPSWiSuvZRif1fD5mLbcUOJUHxhwEHFjXE0puQ7iXz+5Owjmy620u3ofHND4pzaKQ
	 hUmLSAj6TxHEqUwygIZ+/8ft2BJkQAtMgzMKNMsZdoxjzksOQFAjXI5LX2Pd2A2d3/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=mce3LPT5;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAB660A261E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FAB660A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=mce3LPT5
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-94961ed97bcso130465585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1795013258; x=1795618058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IgtmGgLwdp7YHZZLZXtmuM3LeEAEVVcvQiETOOFbu8o=;
        b=mce3LPT5oG7C8F/QlXxfra+ftcUqbbosr68KVWr4liElvzqRdfBEqD/aEKIHceO+Aj
         +7TrSS0VWnGw72sCUYxtMjkg2MrGffSmsRtSP06tlj7q26d8E2nSTu4Z0BSvWs0M5cd8
         KB4LmsGi40TprWi9Dp8BnOyTEmFGkNYhFFanczHDzzKTNXuNvSPbFVnO0PIil/6+GCbK
         TBiO4Rkq/COIB6DJcfaHVgLG+7qjvdh1LPzUR7FonRPcRWRDNzUcdJW0Rcnl2JL9lKHC
         h5D0d4zczwBfyJqPh8GSUOsTeJtA1998BdswYK4nrDfVV55D9/VxOJDtpGtoQt8e5N5W
         k9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013258; x=1795618058;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgtmGgLwdp7YHZZLZXtmuM3LeEAEVVcvQiETOOFbu8o=;
        b=DQfdAXGF/ACtDknCSaOnlKQ2GaEeZCmnaUb6MtNw+8ddGC7tqEG3DO/9teBK3FLq1v
         I1G4rWrOvN0FDRTkQZcH8grVcns4eqju9Wsd1tbNXeh9bxlf68OaxdfpsaWpHXg1dnE0
         NaQEl0SV/CYXg5D4AHcbnjA2O04IGXUx8QhHtA9HAKECz95HyhiQAf0GVEYTYkxHw7Ug
         ddgc1PAUO8wSYqJjt+CgwpeEhi0+avTMrk+Smmb4T7QV7W5NeXFI9nbpG/sw8LY1PDTN
         3rFl3FkAMztRfGTnJ7br4H5yqCbIUk1cnVWM+5uWS6DiY9h4x4UY+sI1xQNhb3Axa7/B
         eW4A==
X-Forwarded-Encrypted: i=1; AL+hErEwNl5ZceS90nxF9GN93GnNhNVAXvO6vl5oK5jSWJWn7mVYfH6I3/pYr4Km9XEShbvaZykUxDuocns4cgg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/f+HR4NP2G2NRPeBcfT9jZ9vpTQ1jVgAatMOW86XwyxQ1pHXc4
	j0Dmp63u+rLBOXF8p+NTjT2dwhgqt2wHTwVXTT5EjwSYkWgRouG89aIXUk7DHQjP6/0=
X-Gm-Gg: AYBFou0L/v4VS0jJD0XSi4vH9si48rg3RfUOq18w2lBwj/mSgIrTA3uNWwTv8CgP5M9
	xIiwtwoFAFi4NvqW0EeNdf0GnB10slCaaogf39b+PQKjfo8vCAqbD8tnEKXT5+bcqSzw6PeNrLf
	I18HP3W4m70yaGVbebrkGBDDkj45v3GHtM2SabkZy/M7AX/b1J9JBPUyHWkhGjck3+FP+uSR8XQ
	Yjx0Ub0Oc7V1scQphHXM/GWLW0DOqp3b5FzqupeqftSR/FIh7rtGnKwBtgykhB0QQ4mbI7/ETgX
	b8miuubd1z+Zz/oazNOXe258hCZFjXNOzJUmTxI3nMQwRIodLKcvnLISItS3AoZWil9mAdyfREf
	DBbVGVuz2jAgSCzOEXqNIP2M0zPz26NiBo7Vlrahb+cynunTP3NjGbP1iR2FxCFpl5kPvUEEkhu
	Cp1XSb9Pf8hmu+PMW2RHE/FjT1O+r0cJwiGnSOOTk7Cb+l6cX15b/z347q+u6juvrtNv7yvtFNe
	EjxzWT91bJqWxC3CbqCe2hpU0j5GBPX2yGzIk/1YH5UxjeU8IKUWRGMIE2HkGjbN2MZXp5ovjMI
	0WI9KzvZWotuR2+v/BhrAgBxO0WHqOW6GudxzX+YpQyT128=
X-Received: by 2002:a05:620a:880a:b0:93c:b5fd:f33f with SMTP id af79cd13be357-94999722106mr491978585a.27.1795013257845;
        Wed, 18 Nov 2026 06:47:37 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b81d4a0sm193898585a.43.2026.11.18.06.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:47:37 -0800 (PST)
Date: Wed, 18 Nov 2026 14:47:34 +0000
From: Josef Bacik <josef@toxicpanda.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Lutomirski <luto@amacapital.net>, Ben Segall <bsegall@google.com>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, 
	David Howells <dhowells@redhat.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ingo Molnar <mingo@redhat.com>, Jan Kara <jack@suse.cz>, 
	Jonathan Corbet <corbet@lwn.net>, John Johansen <john.johansen@canonical.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Kees Cook <kees@kernel.org>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Manfred Spraul <manfred@colorfullife.com>, 
	Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Neal Gompa <neal@gompa.dev>, Paul Moore <paul@paul-moore.com>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Peter Zijlstra <peterz@infradead.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Serge Hallyn <sergeh@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Suren Baghdasaryan <surenb@google.com>, Valentin Schneider <vschneid@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Zygmunt Krynicki <zygmunt.krynicki@canonical.com>, alex@amutable.com
Subject: Re: [RFC PATCH v2 00/13] Namespace for namespace roots
Message-ID: <wdwc3b5edgtgvrgqfhlzhrachr5hrqb7ahipcuqdz5pffxlc5b@662cpwhxwjer>
References: <20261117231352.3816603-1-jarkko@kernel.org>
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
In-Reply-To: <20261117231352.3816603-1-jarkko@kernel.org>

On Wed, Nov 18, 2026 at 01:13:39AM +0200, Jarkko Sakkinen wrote:
> OVERVIEW
> ========
> 
> A root namespace (rootns) is a kernel object backed by a file descriptor
> that binds together:
> 
> 1. A full or partial set of detached namespaces.
> 2. A dedicated PID namespace for spawning processes into, signaling
>    members, and polling or waiting on PID 1 exit.
> 3. An initially empty mount namespace (CLONE_EMPTY_MNTNS) that must be
>    populated before going live, without inheriting host mount-tree
>    ancestors.

This is what cells is doing https://lwn.net/Articles/1102593/, you may
want to take a look at that work. Christian, Lennart, Alex, myself
and others are working towards this in a more wholistic way. There's a
lot more that goes into this outside of just the object itself. I've got
my version deployed inside Anthropic for securing containers and I've
tripped over a lot of pre-work that needs to come because we can tackle
this. Alex has my rough outline for kuid64 for example, which is
necessary for making sure we don't overlap UID's on the system and
create holes this way. The cells work/anything that wants to have clear
security boundaries is going to require that as a pre-requisite. If
you'd like I can include you in our planning so we can get something
that will solve all of our problems. Thanks,

Josef
