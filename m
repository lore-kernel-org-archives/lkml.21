Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858620;
	b=c0Bz9OLM9rOrTTnUwI86sURhEXEEmaiSuKfJs/48WCBJljtlh7TJZtV4orIJ5saXNoHJ
	 yJtEGaJxgQJZEMWOUedtxOo6EjJdEWsMW0UacNF5EXBCFwFNKf6PhJUg24ukzOXncrvqS
	 p3Qn+wk+DZwVKnRn5s1yzUdlXtC5uGGk0AfYYGWXs2JQWxHlG+O62PuN7Qx79d6SISSxW
	 xylKiEfs8UMrDIhTxsKvY3tlMrDySvCWXVnRZ7vjeohhHHHCmYM66raA+Mdh8CCyzPy5Q
	 B6cnqqTUYD7cjnNxhso4SQJ24N9yJX8GWek/5xfp9rrmBxt3OjYgIoGIokdQjOGUWig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:Message-ID:From:
	 Subject:To:Cc:MIME-Version:Content-Type:Content-Disposition:
	 User-Agent;
	bh=aFuH3CwyqkMoGdxfnHGMpD/JLCCKLuO9Rr2dCftzpuI=;
	b=KXWB4XAez/D8/j6tjS2XtOP9hNkT6mOP6k6W5XYMvWEPZ88z8MmKI4SKyljdSh3KoPwq
	 jmgkjxqVsnmc17U3r/90JTbQ/oQcTwJA030KR0U5VL7Rv2dpOW1T7JqEMfQP618tBwFvm
	 dy5ulHP3vqCaOQ9ntI9gp0sozrbhd88LdVyiAwtHCDEvPXXR0IRWX3sPW3Qi93N+RZ/dT
	 6XPnpQoO7mmb3cMT5XEq2SPkP4isCIS7qyqbnSXylnCmXCOwb+fKJQiBsyn1tCOKUcX0X
	 4uXK90igztlYR1HYlcUEzB0oih/seygylZ3S4N+9ufS3ni2rpusxF+SeJF1WxYdh3eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=JikK7AiD;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F58606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F58606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=JikK7AiD
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4cd576f2aso63969567b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795858619; x=1796463419; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aFuH3CwyqkMoGdxfnHGMpD/JLCCKLuO9Rr2dCftzpuI=;
        b=JikK7AiDXvJDf/ciqvCah0/KWbCdIMfKgZGcXs0V9aYVk6ytiwQ6DTBuSrUkytQBfJ
         PMzhzsA+Tt5cyubk3p4ThBmzd1dmMF9425d09sXLUjV6+8ZA347gWoSbmjGlyj6gGOcA
         mUG+o4VpqAbnIZedNFHL5fcwb8iR8lTSrbaaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795858619; x=1796463419;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aFuH3CwyqkMoGdxfnHGMpD/JLCCKLuO9Rr2dCftzpuI=;
        b=kZPqb70mnZlBzBjYTQkkC7jleRYGU+4O/+rDMzSH8k2USGpo3pjnP6G9ukNpIjDU8m
         s/v2OJy+fxChETMFdI2S5y8LfFMuvKBJCDh7hlsTBn8NQY+SCCipwvwYABqiarU3HI8m
         JOmjOspDqJgqTQDjkaSw0y+s5omLXU3QI8vJglYQqHtHPaXoOBImvZ6Tfb70NrsWLJv4
         +D+3iW0dV5z9LoeAC4hk3rAgHa6ON5n0KcFOlZLibo/XtFy3JDFKMxjh4iGHWdloRe9G
         IMVbzuvBEjpax64JMymXj8IREUE1FrqRsJ0jfHxfwm7n8zF7lEO3fes8MxCZZjy2LCxi
         302w==
X-Gm-Message-State: APuU4Z9MruKkL3WU9g3xbi1YjzwCAepW4CaPEzOJxlUphA2J5JH9vLxQ
	go7+xTbkupau22+Pd9R361BNS3TDUJMT5aV6wVjwYbm7OK3QTAzvjOMXNTEuMDWXzKo=
X-Gm-Gg: AZFdTZdiIO05xjnATt6D5RfmDXjMwhVd7Be8xAAez0kJfSMWyV/T0xxf4Ej7ATlRKLx
	9N+FRlkrvPNubs69CtUNc/8sPxEtAQ20LLLoVrKRQuJTBrOTwZVuLnyHpuE3kvdPgjyWOGy6Suq
	sbPOCJEksvjZ6usX+XlZE2OQyaBWuQihggndeqEAm+McMZDiEgWr9GDcAA9sTcym0BssKNSmJvJ
	18fJ5Y1jfDxsW6lnSpiWOgGqPtfKSS9SOldXMJajbZVlXI0O5lFuMv5WdwW8XbaMPl0C7ugdK4E
	PeG/e9tSDDI+xOkBM4yE8+8n+GHJpFzxcglteGUkesOxj+9Yl0F2AiwuJK305YEDflASe9L+OXw
	fKyBRihA+LbOjClsxgsXrM6hdsjX1TQ69rfIcAk9Edxq2aV+2VnvRJygQko7OJAXny7ca5YWHWo
	YzlPv2DZcIBqZoyPSf7IJqTmIrg6PeiWHVbwzmz5F+Hlpr1BRlWr3aO3iJ/a4BX8MMBWcplApDn
	03xxFTQNDivnSw02YTY0bsh1fMEIAqa3rMzHaAklzdQDHcbJP5tlLjDMPQIQMVOUaqNzGCiskUz
	Qou3QBiDKzGqkPH22LfCH65gEyUzJivYEAsR+a4p8b6NAA+jWDQH76YDHjL1SxABReCkzn6m4fc
	UG8t9RyO17fA0SxwFgQEfYdNBnDIRTd5B/Cu0+tcUXpKffy57A65+JP2o6Xs8ctVIF313TrLych
	Tla6tZHXL3VX5mK7wyD+E4n0HbzA2YBVbH/Pq/0PdS0OUKU1zu5kjG1QQ4EIfwkNtOKIdCg/esU
	63rJdTS0t7ko4r8avorZOd4S2clNg7jqEK6+N6Ou2Xw
X-Received: by 2002:a05:690c:4a03:b0:8a8:5c3d:903 with SMTP id 00721157ae682-8b520519690mr101400097b3.62.1795858618844;
        Sat, 28 Nov 2026 01:36:58 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201ba5c1sm105483647b3.3.2026.11.28.01.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:36:57 -0800 (PST)
Date: Sat, 28 Nov 2026 01:36:56 -0800
Message-ID: <cover.1795855037.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 0/2] timerfd: Support CLOCK_TAI
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
    Alexander Viro <viro@zeniv.linux.org.uk>,
    Christian Brauner <brauner@kernel.org>,
    Jan Kara <jack@suse.cz>,
    Anna-Maria Behnsen <anna-maria@linutronix.de>,
    Frederic Weisbecker <frederic@kernel.org>,
    Thomas Gleixner <tglx@kernel.org>,
    kernel-team@meta.com
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
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Both hrtimers and POSIX timers accept CLOCK_TAI, but timerfd_create()
rejects it. An application with TAI deadlines and an epoll based event
loop is left with two options. It can convert the deadlines to
CLOCK_REALTIME, which brings back the exposure to wall clock jumps it
was trying to avoid, or it can stop using timerfd.

Patch 1 makes timerfd_create() accept CLOCK_TAI and makes
TFD_TIMER_CANCEL_ON_SET work for it. A CLOCK_TAI timer is cancelled when
CLOCK_REALTIME is set and when adjtimex(ADJ_TAI) changes the TAI offset.
Nothing changes for CLOCK_REALTIME timers.

Patch 2 adds a selftest for this.

There are two existing limitations I noticed which I have not fixed here:

- Relative CLOCK_TAI timers stay on the TAI base, but hrtimer_setup()
  moves relative CLOCK_REALTIME timers to CLOCK_MONOTONIC. That makes a
  relative CLOCK_TAI timerfd expire early if the clock is stepped
  forwards. The same happens with timer_settime() and clock_nanosleep()
  on CLOCK_TAI today. TFD_TIMER_CANCEL_ON_SET does not report it because
  it only applies to absolute timers.
- The offset which cancel on set compares against is first recorded in
  timerfd_create() rather than when the timer is armed. If the clock is
  stepped between the two, the next clock_was_set() cancels the timer
  even if nothing moved, and a later step back by the same amount is not
  reported. This happens with CLOCK_REALTIME timers today.

I can send patches for these separately if you think they are worth
fixing.

v2:

- Make TFD_TIMER_CANCEL_ON_SET work for CLOCK_TAI timers (tglx)
- Add a selftest
- Rebase onto tip timers/core

v1: https://lore.kernel.org/r/abuTTv9FC__H_8RC@chrisdown.name

Chris Down (2):
  timerfd: Support CLOCK_TAI
  selftests: timers: Add a test for CLOCK_TAI timerfds

 fs/timerfd.c                                 |  20 +-
 tools/testing/selftests/timers/.gitignore    |   1 +
 tools/testing/selftests/timers/Makefile      |   2 +-
 tools/testing/selftests/timers/timerfd-tai.c | 183 +++++++++++++++++++
 4 files changed, 201 insertions(+), 5 deletions(-)
 create mode 100644 tools/testing/selftests/timers/timerfd-tai.c


base-commit: 0359ecff58853a491dd0f09792fea8e87235ae06
-- 
2.56.1

