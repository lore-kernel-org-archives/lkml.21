Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414286;
	b=DFeASNQ8w0R8Iovm166yl3G+VgfLIdhhLNWCcSaUUPqSsqbupRUWh4GS8maC/9sDRV+m
	 XqEx8M6DLi+QivBmHiHLLf27zfenUhYGrNFkC/TnoeuLpFyVpxni3DAJBn275HyDSn/w9
	 72c1rzY3mXbCGblPJpflrkeEKg6Hsz0ErcRQVmdq9qZGyhgYW/vxYYwAqzXkB27haq4nF
	 fBGl1mclVCCv0sUrI2/LovAxslV6ugfFCKZ+AT11d8b1hU7G/vCtBQUHMVzWeYYuNSVA9
	 9M2hCV3THoeFF8+3hIAC+E6XCntbHaCY2gc4nR4ieyfH4/TlrU9w7TvmSvkjbIz8c0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=GwvMLEpH06q7oweFh5LKZ8RQkrZMsU7+3f+WbZdQx1g=;
	b=UBqJViLPZszUDbSA3ZevZvrpCJtTXBYd8VJo/1YPNOhK2zDaMa7MtnCJaAx59H9ikgi7
	 6vxfHAfMUtcH/fRzzImZktKUNJy+EStXgiPnIkHl3qJmpAMz5iaetAC9M0d2Y43fSYp9F
	 okScsvoou4s//63BQRcil1JLSNK8fwd8T7unWs645ioDc1BSX9kNOIAXwrYxtoOcZ/B3M
	 VVx0Cva9j4vVCCMifEKFxahHlCFKUCimiN4yHFHn+L2s5vTpYk3LoQqSLpHi8Meg51oGp
	 PaVEgwoDnJ3DYXBtSs1QAzytHS6NSi6mhy39QVg062rmkSDxU7f7NXSH3Pzxt20TQYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=AuJUjnTC;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679BB606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 679BB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=AuJUjnTC
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67c0bd676eeso1838719d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795414285; x=1796019085; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GwvMLEpH06q7oweFh5LKZ8RQkrZMsU7+3f+WbZdQx1g=;
        b=AuJUjnTCDQjW0sRwRqkQGsiRz50XnJQVN/9h3eRtAnqxV0IaqTgeMpJuWE3mreXHZ0
         u2Dw7h3nBX3Ar9XXtj4bp43M36cLvvdQYcjsAAxJFTaMuMtU3M4puk/LB+8kTFQZupyX
         eyIfE+2JhjPpcsCBYSMq4yMW+VCdu3YJiCIcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795414285; x=1796019085;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwvMLEpH06q7oweFh5LKZ8RQkrZMsU7+3f+WbZdQx1g=;
        b=iBNpkTknjEAx5VXgYAwAnnSoH3hFXXfrVyr/dlA52MAXJXf7fGh52agHqPa9G+5Yjz
         Ph5lA9GvMN/slJiwzrTlZsbBHxuwrYwplu377roH0ukSZym65Sv5WlS6EA3pjzBGDe0V
         yN1AGQsVYmHah+qZyYCUum9CSsMze+H0fAmKNqZsXBIC+ly4ddPRwOXKHb9zXbBB2C44
         OR9xTQ8mM1KVNyELLvyDDILgYQKUBym9rwSSjyUdat3U6U5O4/J78MOl1FNKt2WYDqEH
         P70yS92xAtJ+HQnBJuWBS0J47aDlAQpYEzMbAvbUJqntXYGynFMI3FW7mhYmCBC4yE9f
         uMSQ==
X-Forwarded-Encrypted: i=1; AL+hErEMC0tzIUlAokRI8jcwqZ87goXBM0ZKXwvalAQ6tqZCzJTVik4dUDn3uCM2acGWQ0K9Y+XDhBcUhd9BdII=@vger.kernel.org
X-Gm-Message-State: APuU4Z/072nw8pDAr2Ssnz9heb5HQcCGVBz587KXg+s58pxQOLsoO4B9
	wWGVmzo22auHZqaa7BmEcYpfK4s9uobEMFJI7OU4qO1YNAs0Mga6hmJUkWQgf8WJrcM=
X-Gm-Gg: AZFdTZc9RTxLXOxXQLAEgNLdp69ASj5SLfrdxpXdzYu60OeUxLm92mwMPul2aZcfhnG
	PigUoF0Nwz3DZxd221v+1SbEsoxuGp1/2S6+YsDMPiRVuQgdMiGvaBcBpIJdsNvIbeS/55NTO9+
	HPW1cEjZw2IEe+NGXF2S15hN09PJGC6jt0qZU0rSDXX7gquMYucc+5weEcRmC/L/c3tuuvRB+au
	s6QxY8i+etfoKG1Aq0kIUB8h5sfsZePOn1XtyZsXlMEpKoyEVMWmIbVpPuEERdCQ7l7HJMyH49A
	BoEllOJaJq6Ht6ZsgNsrq8GP4xiBvU39bNQ/JPzNIGnZiSoQeripp5IEpJb8tNMpsiUpxLN95tL
	WGNQ3Nl5/sNcqM7rYAdZtFtX0n5yM06dJbcvSp0K/ELlLGZlQhaaTyEibYv3dsDMLlVPB7J4y1h
	bzvXtHzjBKgVa4UzoOHrsc7ypwYF31Y25CN52ojsSTDa4Wa5B2LMOJYe7L64Gz+0NYrpSXjDMS2
	0Of/8o1KZjsdZ5V71O3nh+ysCSB3sdwMuR9EgstjmjEQaoS4USm4yZ+poCkaIh8Co/4EHGf/SSM
	i21jyt+fVgp7zDJnqZ0SUCcX9uCZspQcg5VTmXc6mlMAEEJV6rNUqF1Aeaqcp0bZV4OoCUHh5xP
	dEYSHqEwYXiGBDy0pIn9IFvoHcpPQuccs4C23BX8HlNj/hFSYPhQXfTf/jMUtQCiiox52FT0IOC
	Q5CyaGeNp3HNryg6RziKWmKF9hl9R52SYj0z3QTw9tfMnQxF5XNueLhT/VF/a5OU02dXuR4ranw
	RZ2hH5I9/UqWUPlr97tOO0ZFs2XuWQmFdGcTpIks9n0
X-Received: by 2002:a05:690e:4012:b0:67d:c046:4f71 with SMTP id 956f58d0204a3-67df43d2bb2mr4679580d50.23.1795414285477;
        Sun, 22 Nov 2026 22:11:25 -0800 (PST)
Received: from [172.20.0.3] (static-host-74-205-137-217.epbinternet.com. [74.205.137.217])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202bc515sm43136087b3.19.2026.11.22.22.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:11:24 -0800 (PST)
Date: Sun, 22 Nov 2026 22:11:21 -0800
From: Chris Down <chris@chrisdown.name>
To: Christian Brauner <brauner@kernel.org>
Cc: Omar Sandoval <osandov@osandov.com>,
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	linux-debuggers@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3] proc/kcore: allow disabling /proc/kcore at boot
In-Reply-To: <20261118-masken-disput-miesmacher-27d6baaae6a8@brauner>
References: <7c10f2e01b6f19229c83e81d887a87f5d1151841.1794904698.git.chris@chrisdown.name>
	<20261118-masken-disput-miesmacher-27d6baaae6a8@brauner>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <awPZCeNqLKVpnbKj@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christian,

Thanks for picking this up!

Christian Brauner writes:
>Iow, it would be nicer if someone took the time and came up with some
>boot setting that is a list of memory protection settings instead of
>spraying ever more kernel command line switches that nobody can
>reasonably remember or use.

Hmm, I agree that would be nicer, but I don't see a good way to do it. How
would you suggest going about it?

In my mind, the model one would have for a list like that is mitigations=,
but it didn't replace the specific switches, right? For example, retbleed=
and mds= have nevertheless stayed. In that case, the list sets their
defaults, but more specific switches win out over it.

These are the problems I see with a list like that:

1. I don't know where the list would live. A list of memory protection
    settings in procfs would cover two switches today (that is, kcore= and
    proc_mem.force_override=). Anything wider crosses into mm and security
    (I have similar switches out for slab hardening and mseal, for example),
    and it isn't clear to me who would own that or decide what goes on it.

2. Lockdown already has a list of what gives access to kernel memory,
    with entries for /proc/kcore, /dev/mem, kprobes and so on (although
    not for FOLL_FORCE), but lockdown= only takes the two levels.
    Selecting individual entries was proposed last year, and the lockdown
    maintainers turned it down because most entries can be bypassed when
    they are used on their own [1]. So a wider list would have to be a
    second one next to lockdown's.

Did you have something specific in mind in terms of a design and what it
would encompass?

Chris

[1] https://lore.kernel.org/r/2vldrnqs6fbljqqp6vbwmkushx6dxcpephgb6svmu5i64lijpy@lg37aflddv3b
