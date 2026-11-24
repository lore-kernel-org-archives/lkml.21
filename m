Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527843;
	b=wMafNgcaRds36vhNVyX2kdO1tGgLAQNH3XiKIvf8brfvLsnqlkY99beDk7wuROd8iazP
	 fzGrlrDFAu9qd0YVqNtP7WjlJGDHXNyKNw2kmPxoLCFAz9JzAwwhkI52TWS09IjYW2ptr
	 q2H6PpYobQFj5l04trIr78AAdvLQPa9H2pHoxnTWwPoSnq0UU0alwk8ZwoVt5Nud91VRJ
	 jD681d6KhZR9iqb6kKdJm28uDR3/djrvJAkdgpgOk+/Ntv5l+HrlqKsSxcdmWacCYNZio
	 SO9ZWePQT2PND3MEpn/bw4Cp0LMc+KLsp4UaK2sTclVSA3+GP98AP45xIDqKtQfi9eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HL+5caFaLNCm0Bzmeli0hxBV4yqLWLj+qSToddXa65o=;
	b=ZMnHrz+DoXoFmDnT58fzGSZNie7z+HuD4+KO8TNLuDNVAoOygBrqJqPSO0FVy2I3dhKL
	 umtFaG3ADiGLpob3tLZqlEq+1KsK4gb1nAMrmXh9z9PoUjPj2yWWKUxDTCQ7aTCNRBi6/
	 MAQjsZaHdy9gutKPkMmtI2khKiyd7hr84k7zR8/nowAqc8AKTY1d88WjqizuyWia2jVmq
	 qDBJ87ymyfcIgVDUKcPOsIkTEJ6g5rAjx5kQFIjEJWB11oTIripUgkirdmeGpDpB1rmHD
	 yVfq1QAVEA2ZE159Q41yTNQxR37xaXHzRk8ESBOrB3paSYD9NTgS2IQVRI9b6zt6ozg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UrutW7Jm;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DF3606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29DF3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UrutW7Jm
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so6112411a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795527841; x=1796132641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HL+5caFaLNCm0Bzmeli0hxBV4yqLWLj+qSToddXa65o=;
        b=UrutW7Jm73su+ht5qlo/MmxHxQTKsyjcHIgWSCzlvLi8qbFUiDmGfUustyKTYAvH6N
         ZoXu7YO4EKYZb/zJVjT5XXlbN3XlAqux+XXPOU4Taf/EPdF2N3XvTVEQ4PBQXqdmEJ6Y
         kqpWDVmwu2IteHmJ2niepLG+Tfl5THcdueQh1Ndo3u61takJHn5nrTfFtGH7gSb3fYXA
         xk4lXtchZ54mU/727M0lb7bXQXiGx1UHgprF4j7iK5wsU4/22SUuW7wA8Z7WoqwQdSBs
         at3WDG3L/1kRPzbBRC+bLOEtRvj0m0Hc6sYohHvE0Jni8K5M0tvh+5aZMHsra8HsNEGB
         tQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527841; x=1796132641;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HL+5caFaLNCm0Bzmeli0hxBV4yqLWLj+qSToddXa65o=;
        b=ljy4hlEhQ9K+6v9MkWbOp8InvnL6CBSiT25cy1RhE8641AvowyzlmOAVdsNIemvrY3
         BCQX3kjItZJ/qLxCBSDqYDr31Hu6gAEIs+ulXiD+nRRQXAPgSKWws5gZ5Pb1jjdtRfqv
         3d25WfuBk1a+w2mIUbDJLXrcKL8VPEVhW+reVc2nEM4KPDIrV8pXiJFxRPBoFocVVphx
         RYxRlrTlgw4lE6/VhAz2vbXGKvtDuci6ltcDVKQ491cWQLBrquOuym5anOa+x2Fx47j2
         1zCux/sBduskccCqwia4NquqJoijRn6FVgU7mAFlyekn9A4e3S9FXW16uGj5Vbx+SUi+
         JpoQ==
X-Forwarded-Encrypted: i=1; AL+hErHKHulDCSWq0K8EiwXmpyvwvrF04wuM0GE+og8zj6oLxyL3Skg2WcwTuUaL38b0Ycpl/shSk86uODlN4FY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UKqZpIdWzvlpuYXdMDly7gtVAtZpk3YfgUWxw4+ACKKouRYmC
	YaZjuLTT7pqi06BlhXvtvfgISogtY7LBL62cMXqj2yBIXuh5UKX0110bYcyXbCs7JhJevcP9XFE
	FnmaJ
X-Gm-Gg: AZFdTZcB+Hq/MPBMCA0q6M/1W67QSKmNQb5g+CwTi3mTMhiX8rlR4bR4gxn0U66FLFi
	VbjiqfjuFDG1+R6rTkg7s7hXs12txS2ySMJtSFOKcJRpv4cDcExTmFZAUC7VNYiWqtem06EPax1
	2anUVY2XmQjVyxSbEaLEdkBQA/NkPAEDBY/zzaHvgDwEpVXm8JXmgT1qWW4j3h1jHXHRG6ITs3/
	iyauJGq3oQVh6Zv4y+WnjZWwt5K0mTBhUINxgwsPJic/zeTRVwH6nvx3TZdUntWwpKj1v4WV0QW
	Gaf/zDH0cjEu7uJJrwqmJ+PLXDt7U4Fnk1vr/LoSYajgvIGF0F5f4A/ULEsyie4DATdHS45rPkl
	ZoochAOuwAEf1PWY+5AuQ36eKfeqQl7WSV2D4nx75moPyMEFmafMP/jTfsFRhARyh8aOcnfY77S
	7gUeoxchxi/XVx1ao93MYUtwWtqavGzatQ0DlKxF70YsTQ+SXiCGKi/MylIFl+Ant1W2astC4yf
	hCJRKZrVTU8CZdB1fIIGI8w4ePZTqumVOFIHnFXYwSgtUi5u3zZIdDW3YNuY/CJq+kCut5G0TYw
	M0mvo0JJUPlEFXOa5Vp7lLYQHrhrkNyGMw==
X-Received: by 2002:a05:6402:3207:b0:6b5:8222:cd12 with SMTP id 4fb4d7f45d1cf-6ba37eb3c1dmr11223007a12.37.1795527841554;
        Tue, 24 Nov 2026 05:44:01 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba6f8fa5b9sm5396452a12.37.2026.11.24.05.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 05:44:01 -0800 (PST)
Message-ID: <ceaea0f9-6f17-4626-bd55-fbc7366905ce@linaro.org>
Date: Tue, 24 Nov 2026 13:43:59 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf build: Only enable context analysis with Clang 23 or
 later
To: Arnaldo Melo <arnaldo.melo@gmail.com>
Cc: linux-perf-users@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel@vger.kernel.org, Namhyung Kim <namhyung@kernel.org>,
 Ian Rogers <irogers@google.com>
References: <20261123-james-perf-late-parse-attr-v1-1-cfebcd81a962@linaro.org>
 <CAP-5=fXuQWTt1F6BvKSXqgSkEtBQPKvKg6gmAe-ngyr4VGyGig@mail.gmail.com>
 <EC27692D-9692-4976-B7EA-4C3A91173CE3@gmail.com>
 <awSu48pUIh942Zm4@google.com>
 <46a896ba-cd45-4747-837d-50ea4b4dbed9@linaro.org>
 <0E9F372C-C100-41EC-B5B3-46FEDC813E01@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <0E9F372C-C100-41EC-B5B3-46FEDC813E01@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/11/2026 13:08, Arnaldo Melo wrote:
> 
> 
> On November 24, 2026 8:24:37 AM GMT-03:00, James Clark <james.clark@linaro.org> wrote:
> 
>> Looks like __guarded_by() has also been around since at least clang 18, so that wasn't the issue. The problem is that it's not supported on struct _members_ specifically until clang 19.
> 
>> I sent another version that stubs it out for < 19 which works. The commit summary changed to "perf build: Stub out __guarded_by() on older Clang versions".
> 
>> The header diverges from the kernel one which isn't great, but I suppose that's better
> 
> Right, but you changed how check-headers.sh treats it to cope with the difference and I'll make sure that tools/perf/scripts/sync-headers.sh handles this case as well, namely if check-headers.sh detects drift, sync-headers.sh will update the tools copy while keeping the tools specific parts.
> 
> acme@number:~/git/perf-tools-next$ make -C tools/perf help | grep headers
>    check-headers         - check which header copies are out of sync with the kernel
>    sync-headers          - sync those header copies with the kernel, creating commits
> acme@number:~/git/perf-tools-next$ tools/perf/scripts/sync-headers.sh --helpUsage: sync-headers.sh [OPTIONS]
> 
> Sync tools/ header copies with the kernel sources and create commits.
> 
> Options:
>    -n, --dry-run       Show what would be done without making changes
>    -N, --no-build      Skip the perf build verification step
>    -C, --no-commit     Copy files but do not create git commits
>    -f, --filter PAT    Only process headers matching PAT (substring match
>                        against the kernel-side path)
>    -F, --force         Sync also when both copies have content the other
>                        lacks, after manual investigation; tools/ additions
>                        dropped are recorded in the commit
>    -o, --output DIR    Build output directory (default: /tmp/build/perf-tools-1000)
>    -v, --verbose       Show more details
>    -h, --help          Show this help
> 
> Environment:
>    SIGN_OFF_NAME       Override git user.name for Signed-off-by
>    SIGN_OFF_EMAIL      Override git user.email for Signed-off-by
>    OUTPUT_DIR          Build output directory
> 
> Through make:
>    SYNC_HEADERS_ARGS   Options to pass to this script, e.g.:
>                        make -C tools/perf sync-headers SYNC_HEADERS_ARGS='-n'
> 
> The script:
>    1. Runs 'make -C tools/perf check-headers' to find stale copies.
>    2. For each stale header, identifies the kernel commits that changed it,
>       including the merges that brought content of their own.
>    3. Copies the kernel header into the tools/ tree, skipping it when only
>       the tools/ copy changed (it is ahead) or when it carries intentional
>       edits, and stopping for manual investigation when both sides have
>       content the other lacks.
>    4. For beauty headers, runs the relevant beauty script(s) before and
>       after, showing new/changed string table entries.
>    5. Builds perf and the other consumers of the header to verify nothing
>       breaks.
>    6. Creates a git commit per header (or group) with the standard commit
>       message format.
> 
> acme@number:~/git/perf-tools-next$
> 
> I.e. the limitation in point number three, about intentional edits, needs to be lifted.
> 
> - Arnaldo

Oh nice I hadn't noticed sync-headers.sh. What's the plan to support 
tools side edits? Something like exporting the kernel change as a patch 
and trying to apply it on top of the tools copy? Or I suppose you could 
do it the other way around and try to apply the tools diff on top of a 
new clean kernel copy.

> 
>> than someone on clang 17 or 18 missing out on all of the lock analysis.
> 
> Right.
> 
> - Arnaldo

