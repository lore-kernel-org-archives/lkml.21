Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019608;
	b=Ms2tQBtZO9ylY2FjCK4b9O6nwFa++V74VUB+F+X1ceLEEPy/wmuLwu5SjeG6UlcPTzSf
	 U/Cd0uOTWOabu9e8rv6+FR+xwYa/vyJwb1rZhm8qgFrCraxh1GWwVIS5YA91E+YB45+UI
	 vJ2gURKGt3SijwAkYbYTuBwGezFlP46nabMOpD5YVZkOsCGBxwM3O74/kUzsTukQFstCo
	 EA9xH/219Chv8CD7RYcqRqRgnQOhcoFHjJ2UrrSmfWkDvuA0eU0G0jA5ta9KzTjYfGgJg
	 xTWmzigpjOfB+rfrjg9jzU1Ab2qlRHE60giPOE9FifceCdhDBUKmi8DFykhC1FlH6Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jZUvrbhbcZvb+yNyUGJEDBN+jZxprMUpQ75mT/ONYDg=;
	b=zqnvDNePW6sskZuCHp+LD1iUFVo/OyNn6SwdNP7sQSiydyBwVrzLbD/8Uy+yQGqpAP3l
	 Vxd0by6bxdPC/YYGsjbFY6jkYHJCeVPssqLwLUumPXptx8Fccs3UxPqHkRXmu1aN/F5VI
	 RFjR6cYXUJuDV84/Do1b5Bly6ZX5s5vcubFgFFTbOW1dkvajTlTIuPxhgfASwrTktKFYv
	 v9Q6BJ0WrnahW9FirLwQas9JHQuZwzhe36I3IY7S/L9V036qeoAtnj8sqDR86Au1diRhO
	 DOJWuiAB0W839fiIltudZWfiycViW4KvzvzO1miBzx5x5Keop/IGFIzVGFQPcjo34yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pMMGfoUh;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C955F606A7DA
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C955F606A7DA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pMMGfoUh
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso8692445e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019603; x=1795624403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZUvrbhbcZvb+yNyUGJEDBN+jZxprMUpQ75mT/ONYDg=;
        b=pMMGfoUhkARBQHUjBg3XEEiwWBS6QuzdNEjV2VYyvSUmbiwb3EhWkofvJr3aswn/hx
         eYwWrdrSB7cvRTkApvkMMk7Jf/4KwDjmKRez2yQAQAzhfXPIy7rJ3j+E2aRUmeeMRUz4
         VBx+9LKHeu/vi6CYEmSmAiAkL3mLQWjscSfcbwOtyIu/HBvrei8sPwEiffI79k6Gym09
         S8etFOHQmFXyXT2g/55XcrccBvdwyWpvit+UbaDXDfL4KYcbStoEpBSma9BbsMJtTsT6
         8411VtgQs13yMa5FA0kHjucXbyl5/ocvpnK1lOqTzh8Z+eAm5EMJ5IKC2700IT+XovHl
         UJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019603; x=1795624403;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZUvrbhbcZvb+yNyUGJEDBN+jZxprMUpQ75mT/ONYDg=;
        b=OAxPIZZ3ZrCGipd92WuACTfav7HODs8KGXlv7WAXuIP7xEJIJNMpb9S9Bg4GEaJnjN
         u0ULNnrtzQsXr/EfaFRkd2jegQGhK7p5MabIoH5+OP4eFykzb9FL4Cr3USb2PBM3RM9Z
         jk/wrJK2rweC4tMGKYX+fV38pdWqd07kW0/RqJMwTXq4t6wFPkHW7VadBpkzWuJXvczX
         LLmS+1sBImvOGJMw70/gxqIdXUE93yi8SrOik3SKyRACdpN2qhsXVgsq251JDrI3nkVt
         2AlCIYvZNRbQNVd0Z6LIsXiYlkDZ+s5kGLe6b3cCAnz/aGs8gjoitec9e9gXd59hzuY1
         c3TQ==
X-Gm-Message-State: APuU4Z9NRu59+pd6GBVqA9bCJaLtqF6REbxGKy1YgJFv4xanNzYMDuUD
	gs0X7/Ir1n1AZMoO4bTfCjm3JGZM3b8mR+PfYroezb/QPlxoFzjaxf0sH1yF/k09ouQ=
X-Gm-Gg: AYBFou0AzntXyaci4P/sfX1e1i6f5tI5Scw7/xdwF9Jp54poVt3b0BA/p6NvwHr8x/O
	ICj2lzYs5OSV/Xt6eM8xXYyUENDb1DPaRIf7re5XwHeX5FKddPJqufT+L/aPEMRNgg73dHxTkF4
	TnnVeT/GCMUZyHVZjkCACoQhGeahXbf5THmjrhKqDzXAWQrW54cpx6y+JjngdRjFR3u5BYRszAZ
	L05k4tY03dph8brClkx/ed3Qy/G1mPX/nCW6WPg4HJHsjzWU90Qk+SUCiO78lUVwn5d5Z2arWDz
	M5grgBKcaQyomjGME46SULGP05jTAstMO2NzKhwTmcgvrIaVN1U8cWQhRlb9VRjE9xqZp9pvDw+
	c0zlOerUMrJZVUkIcO928S8CkDc5e8M7MNg8RPoTZKRePcAAFgVv61Yb0P4MpNXhDkhnv3I743j
	8gV9YyAoZ8yKQVWRHGCgFrB6uw+rEaiMuomI8WDUwNUw2QnvV9ZGKKHYwhFIQz2L6VrJ7eOCJ6X
	FmcIpnKkqUYfsGbDz+WBQyL3gSVOFIKpTn5YWFHjoOD4SOr9OD1fWyM0zbd/mRey3CMdDid0bY3
	DtGak2UeP4ScLW0qrts//tJvi8HGbLCbjw==
X-Received: by 2002:a05:600c:19d2:b0:4bb:5de1:e912 with SMTP id 5b1f17b1804b1-4bb7d5d6636mr63465845e9.1.1795019603103;
        Wed, 18 Nov 2026 08:33:23 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm167009625e9.4.2026.11.18.08.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:33:22 -0800 (PST)
Message-ID: <c9a9e247-265d-476d-abc1-308fbe1d4a2b@linaro.org>
Date: Wed, 18 Nov 2026 16:33:21 +0000
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
Subject: Re: [PATCH 00/34] perf cs-etm: JIT decoding support
To: Linux perf Profiling <linux-perf-users@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@arm.com>, Amir Ayupov <aaupov@fb.com>,
 Suyash Mahar <smahar@meta.com>
References: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 18/11/2026 16:29, James Clark wrote:
> Restructure the Coresight decoder to decode trace in order with the Perf
> events. This improves decoding accuracy all workloads, but particularly
> with JIT code when instructions at the same addresses are re-written.
> 
> The resulting decode loop structure is simplified to
> cs_etm__insert_heap() and cs_etm__pop_heap(), which work in the same way
> for all of the timeless/per-thread/per-cpu etc modes.
> 
> For every Perf event, we pop from the heap while the packet's timestamps
> are before the current Perf event. When a packet is popped, the next
> packet is decoded and re-inserted.
> 
> The same path works for timeless mode because we can just assign the
> timestamp of the AUX record to all trace from that buffer. This also
> improves timeless decoding accuracy because now we don't use the
> timestamp from the very last AUX record for all samples.
> 
> In Coresight trace, timestamps come after their associated atoms and
> Perf uses a single decoder for both searching forwards for a timestamp
> and decoding. It does this by caching decoded packets into
> packet_buffer[] and replaying them once a timestamp is received.
> Unfortunately this does't work for strict ordering with Perf events
> because while searching for the timestamp the decoder will decode trace
> using previously seen mmap which is incorrect.
> 
> To fix this, add a "packet only" decoder for each queue. This is used
> for searching for the next timestamp after a discontinuity and not for
> decoding trace. Once it's found, the backend re-orders that timestamp
> and the previous packet before delivering them to the frontend so that
> we can be at the correct Perf event before processing context packets or
> ranges. Excluding the tests, this patchset results in similar total
> lines of code but if we updated OpenCSD to return timestamps and
> discontinuities in the correct order, then it would be a significant
> reduction in code and complexity.
> 
> This series depends on https://lore.kernel.org/linux-perf-users/20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org/
> 

Assisted by various Claude and Codex agents.

> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
> James Clark (34):
>        perf jit: Support JITDUMP_USE_ARCH_TIMESTAMP on arm64
>        perf jit: Add name of clock in error message
>        perf jit: Add address ranges to DWARF compilation units
>        perf libdw: Don't look up the module by ELF address
>        perf cs-etm: Use the exception level to tell kernel from user
>        perf cs-etm: Don't read past the end of the map
>        perf build-id: Cache the vDSO in build ID mmap mode
>        perf cs-etm: arm-spe: Use arch timestamp in HW tracers
>        perf cs-etm: arm-spe: Report error if default clock isn't used
>        perf cs-etm: Remove old pipe mode support
>        perf cs-etm: Track threads in timeless mode
>        perf cs-etm: Track sched out events
>        perf cs-etm: Handle PERF_RECORD_SWITCH events
>        perf cs-etm: Always enable Perf event timestamps
>        perf cs-etm: Use time from Perf samples
>        perf cs-etm: Don't buffer non-timestamped packets
>        perf cs-etm: Decode in order of Perf samples
>        perf cs-etm: Don't special case per-thread mode
>        perf cs-etm: Decode one packet at a time and don't estimate timestamps
>        perf cs-etm: Remove the decoded packet ring buffer
>        perf cs-etm: Fold packet state into the trace ID queue
>        perf cs-etm: Rename trace ID queues to trace ID contexts
>        perf cs-etm: Rename tidq variables to tidc
>        perf cs-etm: Share the thread ctxt between frontend and backend
>        perf cs-etm: Consume each OpenCSD packet immediately
>        perf cs-etm: Split base and packet decoder state
>        perf cs-etm: Add packet-only timestamp decoder ops
>        perf cs-etm: Create timestamp decoders
>        perf cs-etm: Find timestamps by searching ahead
>        perf cs-etm: Invalidate OpenCSD's cache on MMAPs
>        perf test cs-etm: Add a Java JIT source-line test
>        perf test cs-etm: Test trace is ordered with context switch records
>        perf test cs-etm: Test decoding of kernel modules
>        perf test cs-etm: Add an HHVM JIT call stack test
> 
>   tools/perf/Makefile.perf                           |    4 +-
>   tools/perf/arch/arm/util/cs-etm.c                  |   21 +-
>   tools/perf/arch/arm64/util/arm-spe.c               |   11 +
>   tools/perf/jvmti/jvmti_agent.c                     |    5 +
>   tools/perf/tests/genelf.c                          |   70 +-
>   .../tests/shell/coresight/context_switch_thread.sh |   20 +-
>   tools/perf/tests/shell/coresight/hhvm-jit.sh       |   89 ++
>   tools/perf/tests/shell/coresight/java-jit.sh       |   65 +
>   tools/perf/tests/shell/coresight/kernel_module.sh  |   54 +
>   tools/perf/tests/shell/coresight/lib/PerfJit.java  |   82 ++
>   tools/perf/tests/shell/coresight/per-thread.sh     |   45 +-
>   tools/perf/tests/workloads/jitdump.c               |    7 +-
>   tools/perf/util/auxtrace.h                         |    2 +
>   tools/perf/util/build-id.c                         |   12 +
>   tools/perf/util/cs-etm-decoder/cs-etm-decoder.c    |  790 ++++++----
>   tools/perf/util/cs-etm-decoder/cs-etm-decoder.h    |   28 +-
>   tools/perf/util/cs-etm.c                           | 1515 ++++++++------------
>   tools/perf/util/cs-etm.h                           |   56 +-
>   tools/perf/util/genelf.c                           |    2 +-
>   tools/perf/util/genelf.h                           |    3 +-
>   tools/perf/util/genelf_debug.c                     |   22 +-
>   tools/perf/util/jitdump.c                          |    2 +-
>   tools/perf/util/libdw.c                            |   16 +-
>   23 files changed, 1643 insertions(+), 1278 deletions(-)
> ---
> base-commit: b7ff10b9ddec8da75304c40fe4abf1ee4f9f0a43
> change-id: 20260824-james-coresight-jit-250f19309e35
> prerequisite-message-id: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
> prerequisite-patch-id: 9c49b9ffb75309e9187eb2e3ef84026118fcfdb5
> prerequisite-patch-id: 4ce0ba0ab1302c9043f0d0734d9cf6a35298bc47
> prerequisite-patch-id: 5e69770fbaf94296da5c474ce09539a1993bc61e
> prerequisite-patch-id: 41d797af2aba7e97ff4435ae2659629e026d36ec
> prerequisite-patch-id: d5f67b3b704f4f4b3d9e39c4299d13a086b29363
> prerequisite-patch-id: a99348cc2065af31840f652286f840f23395892f
> prerequisite-patch-id: aa90408e69dedf9e68d7158f2499bd9fbc7b0b40
> prerequisite-patch-id: cd31a650f8dd3e7a9795fa641eee2415b126ad29
> prerequisite-patch-id: 922a7fe2937a575beb8d0e7777fd869a11023eb2
> prerequisite-patch-id: b0436630e22fd92803e277cd08d782c50f135be6
> prerequisite-patch-id: e136ff402ddf5121c63c1393b7fc00a826f60a69
> prerequisite-patch-id: 8a2674fa45e40848742e8b8472003e2b9706211d
> prerequisite-patch-id: df905386a100ac4b8b047328de08da86b3adf241
> prerequisite-patch-id: 44ee88eeafd54c0148ed2332dc5e33f1ba6dfce4
> prerequisite-patch-id: b9622164f99682ca6b813b9d38ced3e95170653e
> prerequisite-patch-id: 2f22df1738caf5af3a631851d8a57fc3bfea7742
> prerequisite-patch-id: afe679ea285ddc6cd281f697ce504b7a18888999
> prerequisite-patch-id: f507254858995051e8e1b96fb9fd95506228c5e6
> prerequisite-patch-id: 6fe822580ea330633f8a23260aa7b2c7de834ab3
> 
> Best regards,
> --
> James Clark <james.clark@linaro.org>
> 

