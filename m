Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541741;
	b=4B+gD6DtLSwAIKDD9FyFr5zha4zOo/Z3whtsV9W9qjC4oNea+fmqgD7xc3G+hEHnxo1V
	 yn6KHuaz7zUU2JNqI1iMJA7FBlWp/wWaHQ+iBcOlr3KQClK10sw6zpbo1xXS/mxB4dB44
	 f2jUVPZb24oalPe2gcISnoZc/sMbicVedhPxbkGlPqDSBino5LmyJZidGipEI7TnhquY8
	 mVJ33wrKzQrCig7zZOyjDMSdRI2ayZXueyKyNqddpNrW9GN1IlzA65bQ95szgiVcI3RIn
	 MPJWc9WWCIgtzNwsuj1XPTRxakDCMtBFHVuDlSSs8u56jfUyeKuZYDz78JPG+J054WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Cerw/Z7KIbXX4bOl2Vw1MF/BZKr852ZbBEpPnDE+6mw=;
	b=z0kHF5NTfeElEVVxxFEXV9tOpppjSmJmiNbSwl4LlF4b2AoYbYORtYEfuwba5mow2B1H
	 3GE/RrCcjVyfCGUNW7l+mD4hi6bGctv7nBl7PdI3mN4WQDSsK6QFZSrO3SibIoI/OnoK1
	 JKdX9cBqbL8rNPHpa3e64KyO+W3apa6aNYt4EOM1NaHUc8lo3mlFP/pzAJAyKfQpQYSD8
	 238Svpm78e+DUjMlZ5YDiurxfFXm7nIdozM4uWyhxX/kKK23j+YaELv7QAQQ/ZQF1YJM0
	 NlabMsQhmbwtiIWn48jCLewkTwbme/5Zbq6kiKCNgSA6yJ5CEE/7ppPrJsXpT92lMBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bD8uc4vF;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F24E606A337
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F24E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bD8uc4vF
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-491971ac844so4399408f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541739; x=1796146539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cerw/Z7KIbXX4bOl2Vw1MF/BZKr852ZbBEpPnDE+6mw=;
        b=bD8uc4vF8J9geK8iH88yaXJBF/maPWDjivN/U9G4xSaoBmWPAOsXoLld6tJg7fXty3
         haMkXbr/fKxihHDLmWFA9i136CGI8AQXavJ2jZmOGAQ5M4cq90284QmA1euiXzwxBhcy
         /yvLyPAHaa/6vqfizpyrfCiKT7kCY2Wz8ZQifPdWEpRIrXP4KReRnI4LFnIeEDvY7sJT
         t7MS4LyIbjYh8drWTGpjynNun+6KlHWr/lEq+GclIE4mo92jBQGnnlDZlNT51UGJ3qXx
         GYsYh102xj9SDAoJuSdRgdJPhbXLryRfHGO7ytr3PJNzUfrNka7SvGGIheWJL7uiXCSU
         q7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541739; x=1796146539;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cerw/Z7KIbXX4bOl2Vw1MF/BZKr852ZbBEpPnDE+6mw=;
        b=QVVubfLiM5Avy6RNR8EVpncUCMNWQfL3dQXQNHUj0psbzaVTHtx0OjdatY2A8UAy1Q
         8+oUelGA3V95YA4bXGSq63f/BG9j8VehE0iRfj42zylpHOmp4yeBkHD1v2wBEsf8SsIb
         NNRgYJ2FYBsJYnq8sSsbVmazo6niVBLzBmoL+cwQiSMhVIaOonu0nooYH8kUhcpZGBUL
         NiXeJ0m2raR4K7kiOejrdlML+Y5+YPpf78T6/Qx1gtZQ22NI0vC1faPn2D0kv856StwB
         aHxj7maSv8xTwVrIatZeq2UARW8p3YBjqP0u//yX3ZXL2BphZHLlBmebJKAnt6xuvQIc
         0j2Q==
X-Forwarded-Encrypted: i=1; AL+hErH5n/z7Iu8Nh8yHGnQ+aqNMgpWuWtRWNG2ACpvdI6ttYflBP83f8grpCIfi8jHHqU+qn1ob9YI+XYKaMpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+G5Eq+hn7vEUkGBVhVmKtng6tezJUK5k6kPeR+evEUoUh1/iWA
	CoL1Mg92myTC3p8Y14drvJAHffdPpUtGTNPliXruhCN/H1u2nddwCceF8eqkrcSA6o0=
X-Gm-Gg: AZFdTZf8Nk7ByYDDfTlgWPuNbp/Lt6zgWJK5871cd/aSWnroqCLhnnsLN8OlrB53RYv
	29OG8js6MOLPeLGCdVMJ++LNB5JffSyTEcGEmAdCOKFrv8k2ZhufdPX4keNDZe1qYReipIcD0Mb
	Zm/LfoLHoJ0Bw/Q+e8WUmPe7xlVLOjLCwbyNsfUdBTUhik0Ck/rcjgrn9GLO83Wco/MjQxBSxn4
	p1X/jPr+TCFRj0zsoyUhCRqQwH9HTcLPYPsoTKKR4+kVojJXnyQ9cWDAmrqrK2GBdaUANjvhZdY
	dOj2FoBypoS+2pPcOg8HubG2y/pKZuv+uBH0YBXOoOrakddp0g4V5pgSxmnDH4B5C2tbCeThOjG
	b+ccESoqXtbt4fVsmYqIc8cYhrQOeHpFiYfWXIeON/CFxYR/vL7DSOhS4P0+fG0+9Mm+uQKaTtL
	tUemO51f3s2uK7vqvC8sMfFep4SvresKVYPfaCWgYmsWlYqfneZoYFuGiwVoS2+qFF4w74dHtax
	gmXjva1xlT9XbiKCwmlw8E7tM7THA5Butu676Wn6u0F0G5d+zrCmboHqbxH7Z9xnUoMfP+F+fh8
	U84OdE0edLJuARWsL9084wrSq70TSmvXc6eWkLIyVU0sIsVpgJOIqvI=
X-Received: by 2002:a05:6000:990:b0:493:ec0:861c with SMTP id ffacd0b85a97d-4abb0c5d53fmr28875984f8f.16.1795541739288;
        Tue, 24 Nov 2026 09:35:39 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm28453844f8f.30.2026.11.24.09.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:35:38 -0800 (PST)
Message-ID: <fa4e19d5-2e66-4468-9860-19cd9f3ea8db@linaro.org>
Date: Tue, 24 Nov 2026 17:35:37 +0000
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
Subject: Re: [PATCH v4 00/19] perf cs-etm: Per-thread mode fixes and snapshot
 wrap support
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org,
 John Garry <john.garry@linux.dev>, Leo Yan <leo.yan@linux.dev>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/11/2026 11:44, James Clark wrote:
> This series depends on:
> https://lore.kernel.org/linux-perf-users/20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com/
> 
> Fix a few issues with per-thread mode:
>    - On nVHE, everything looks like guest trace instead of host
>    - Tracing multiple threads didn't really work
> 
> After adding a tests for those, it turns out there were some snapshot
> bugs not picked up by the other snapshot tests. That showed that the
> different snapshot searches for Intel BTS and Arm SPE were inconsistent
> and I think all tracers can benefit from using the same pointer fixup
> logic, so that gets refactored into the common auxtrace.c. Then SPE can
> just share the Intel BTS search as it was obviously copied from it
> originally. IntelPT keeps the more advanced duplicate data search, but
> in the future that could probably be made the common one and all tracers
> would benefit from using it (except maybe BTS if it always has a very
> small buffer, but I doubt the overhead of the duplicate search would be
> an issue). For now this is more of a refactor rather than behavioral
> change so don't do that yet.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
> Changes in v4:
> - Change test snapshot size to 128K for 64K machines
> - Put patchset depencency in cover letter text
> - Link to v3: https://patch.msgid.link/20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org
> 
> Changes in v3:
> - Keep the find_snapshot() callback instead of adding
>    snapshot_has_wrapped() and monotonic_snapshot_head boolean (Adrian)
> - Add auxtrace_record__default_find_snapshot() for the simple search for
>    BTS and SPE (Adrian)
> - Add auxtrace_record__snapshot_fixup() for any snapshot search
>    implementation to use to update the pointers (Adrian)

Hi Adrian,

Did you get a chance to check these changes? Sorry it took a while to 
send the V3 after your comments.

Thanks
James

> - Reword UINT64_MAX timestamp comment (Leo)
> - Fix disassembly test after rebasing onto exception sample fixes
> - Only take 'perf_guest' into account if there is no PIDFMT_CTXTID2
> - Improve decoding of old files by hard coding queue 0 for per-thread
> - Link to v2: https://patch.msgid.link/20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org
> 
> Changes in v2:
> - Remove stale "may be reset to -1 in per-thread mode" comment
> - Set CPU when queueing auxtrace fragments otherwise
>    auxtrace_queues__add_event() overwrites the queue's CPU
> - Link to v1: https://patch.msgid.link/20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org
> 
> ---
> James Clark (19):
>        perf cs-etm: Fix nVHE per-thread decoding
>        perf cs-etm: Warn for invalid timestamp option
>        perf cs-etm: Turn on context packet timestamps in per-thread mode
>        perf cs-etm: Use per-CPU queues for per-thread mode
>        perf test: cs-etm: Increase window size in disassembly test
>        perf cs-etm: Don't drop previous target for kernel samples
>        perf python: Expose sample instruction length
>        perf cs-etm: Use instruction length in disassembly script
>        perf cs-etm: Increase default timestamp generation period
>        perf auxtrace: Turn Intel BTS snapshot search into a generic one
>        perf arm-spe: Use generic snapshot search
>        perf auxtrace: intel-pt: Use common snapshot pointer fixup
>        perf cs-etm: Queue partial AUX records
>        perf cs-etm: Don't print missing buffers in snapshot mode
>        perf auxtrace: cs-etm: Capture wrapped snapshots
>        perf test: Allow infinite named_thread loops
>        perf test: cs-etm: Add test for per-thread mode
>        perf test: cs-etm: Test multiple per-thread threads
>        perf test: cs-etm: Increase snapshot size
> 
>   tools/perf/Documentation/perf-test.txt             |   2 +-
>   tools/perf/arch/arm/util/cs-etm.c                  |  34 ++++-
>   tools/perf/arch/arm64/util/arm-spe.c               | 147 +--------------------
>   tools/perf/arch/x86/util/intel-bts.c               | 115 +---------------
>   tools/perf/arch/x86/util/intel-pt.c                |  21 +--
>   tools/perf/python/arm-cs-trace-disasm.py           |  22 +--
>   tools/perf/python/perf.pyi                         |   1 +
>   .../perf/tests/shell/coresight/per-thread-multi.sh |  76 +++++++++++
>   tools/perf/tests/shell/coresight/per-thread.sh     |  48 +++++++
>   .../perf/tests/shell/coresight/raw_dump_stress.sh  |   5 -
>   .../shell/coresight/test_arm_coresight_disasm.sh   |   8 +-
>   tools/perf/tests/workloads/named_threads.c         |   7 +-
>   tools/perf/util/auxtrace.c                         | 145 +++++++++++++++++++-
>   tools/perf/util/auxtrace.h                         |  18 +++
>   tools/perf/util/cs-etm.c                           | 113 +++++++++++-----
>   tools/perf/util/python.c                           |   1 +
>   16 files changed, 420 insertions(+), 343 deletions(-)
> ---
> base-commit: 28ef93607ad52acc8f8be25199711153ba11a0c2
> change-id: 20260605-james-cs-unformatted-per-thread-fix-50e723aa7f0e
> prerequisite-message-id: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
> prerequisite-patch-id: 4ef889ad751e344ae47c1d75a2a2e6cb2eadf6e1
> prerequisite-patch-id: 636b39730334cbc5a76642c070e704ffe178e7be
> prerequisite-patch-id: fb58f6daebdf5a194f8aa56ccc4022f932a5a6e5
> prerequisite-patch-id: d240c10c6824f8ae6c3f10a1da01226a957f05fb
> prerequisite-patch-id: 17b291db261e32dcb0d6f1ab2ed0adb7e0411813
> prerequisite-patch-id: 45ae1d523c9e5c8c573309f1dab107a598f3d4f8
> prerequisite-patch-id: 39a3eb25b3a45f4481760c25fa270773bcfd94f5
> prerequisite-patch-id: 5723a15636c2a28ec40eb6b5c9836d162e971786
> prerequisite-patch-id: d18054b586fc38bc832ead185e8c1fbb0ce46f39
> prerequisite-patch-id: 6735b192189d7945613458abce3da871cb79b35d
> prerequisite-patch-id: 387cb2c6181bef8f45a8fb167e8ef86e4a54ff69
> prerequisite-patch-id: 50243a8d1739141aa24aa371a8452d4d2d078a99
> prerequisite-patch-id: 2ae6f1e7707ba0c71a0678331b02d738fb25cb3c
> prerequisite-patch-id: 1fa0a90cfbc904c4429c1427409125ac44b27aed
> 
> Best regards,
> --
> James Clark <james.clark@linaro.org>
> 

