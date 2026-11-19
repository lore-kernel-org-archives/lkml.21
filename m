Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082922;
	b=a5uPLymhk2csjfKBKt/QFz/DunWMwJLtmhZbsZ/ARA+WVyBxcCRQO3gradoQKFSGrTLc
	 ZsJZnfr01iNm71VBagT5+6igq524WMQoFXfIdkyypuusXnr7WXFYemh3yNdIp80Vy+qgD
	 h4yUwXaMdi7oVXcya4oaNb2b+5VI4X63+aMArgJlD86dCr9JqPgWhjlpk0jB+ceVTkOwN
	 I8eJcVUzbab25Cwsk0BTsnZaDpDw7smZuTC8xdYMk8r9ANkC08qIxZQ7g58HAx3gq7OgO
	 OH9XL8JjW18zN7JOt/qE+JwaSLjhWCqQFq4ScGPZ1rHIA/maqFJI6D81oq5BfXJi6wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=43hk92dqRNgt3cJF1KJekR7Qr7mj7rm5DTPnHeQ1LlA=;
	b=ltS+f5EPDB/OLlTFQqZPP8i/fPZKQ8nblJgz4W+t5zE/6nicUg6BWW5kn+460N6zD142
	 krhD4tUPzx1UcujQkUhaRB01QEzIcO9AfL1nG2XZBS0UP9EIH77JEthxyJ7D+LxykYO52
	 w+uTJFZNnhpF++mpyN3Jp/mOjTTZ9TdT6xeXqq3+6fFLQI/7gFnkMOwPB1r9ZeB0n7rHP
	 bsB42oqKCrB9ivf4/pD5woUHUl+OAoR6tvU5MX2azHdRSH4+kiThNr5TZSwZxoeJ60Isl
	 ll1SnjYVs0iFXsu8PJeFnZ3IcZDOOWWEF2tKZLH5K9HAJYvpUjVyD1KXnq8OVMwUNGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+2ToTwP;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AA3606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2AA3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+2ToTwP
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2af4c8d00so4170251c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082921; x=1795687721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=43hk92dqRNgt3cJF1KJekR7Qr7mj7rm5DTPnHeQ1LlA=;
        b=C+2ToTwPlQU8PBN5Znee5RrKShji/ugJOPeVoPukgf5SnMN/CEMGTnGy9uBYVOmo2e
         LKWwgqQW8Wy7a9zvKqY0AOayH3bM9ZkYAx6sdWFKHmngT2z8vLNlYkuFUAUlDSUOwEW1
         qsSkB5ki0ufjSY9dp6IHtP2LT77JDA5/+srurvQAvCrZz4UkzbrYh//TvjPYyrjJNgzZ
         Z9JomJ/NwgtvOhD0BDGVEbM1xHCIskI9TeLJmWFtNDwjy022SLg2XkbW/nFe8H2Uvr6Q
         EyTHaJAMCZ876Pwysvf7v9MEsspHPryj04BPurtfZc/AxrNj7Ccj6JR6cZM20P1/yRLQ
         wd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082921; x=1795687721;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43hk92dqRNgt3cJF1KJekR7Qr7mj7rm5DTPnHeQ1LlA=;
        b=aBCpbZ+2+MAXUApLoGMgbYOdaxzOOA/s8ciW7zNDRx0DvF7uUAZc1pBBLsJscskCfF
         oZ6UWkdlhIZJrvv2PpBJBCrsCV28w+DLImd1cBNr2cosZPC3tURxr5ZkF3xbrrdx+Nli
         H8XLWA27BeXp3JRxqBSmv/oFUiE+Z/ABvr7mhAUtPYIccbjD7cOrWbWy2+TN4JXGe1rY
         V2HuDZmcwP4BTX1vlyBrOzgCsQ7+XCFJnegQ/nslZFcJ4Dr5sV+wy/RZYd3q4VBRojTm
         icJH2zid+JLCQ43XIm2Zok482yhNbRe7k4DTGG2Xuaot0hFFjjOrtgyLpMhuqSNkAzRw
         u/Eg==
X-Forwarded-Encrypted: i=1; AL+hErEpJxkaLbXye8sm6zOhBR/sEwWd3uxOXZgYznG8QAk/6Sxk2e27r4kJpWNEI5y/mfDZxfIhxmyNvVpP8yU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AHtHOn77VJY1mJ1+2qSOdw+MaZM2epejo/jsMyb5Q3ce6zJSq
	NRpCm7yUXN8l9LmQO/aY6+EWVUi7uIjWR5KqmkbRiQHmdLPeXuPhOmYG
X-Gm-Gg: AYBFou2vIMa9a9k1aNg2z1mpwnEFVwNGO2aPw/J/jq5gPNv+krO3iqs5sXesjntId46
	K7RWz9xaE48hg+NSqbS4VaGp6qaHyLp9mk6KJn8uaB7l9Iq56+3tMWST4dxZYMBP+pyKvEdjsxp
	VcGtG8V4GaGwXYNpT2qNxP410/Omrx8pb6iQ2Hl58UM0PHw8fQgA0ghkLp/FOi6CfkadfKEwrpJ
	t212MTFWenc1ceRWBcaPQvabz/65QLq5loRguzG2fBT2+xdrLTK+Ry3qnPWBNOs+ybnga5yDL9i
	LMpX3ZiMY6bAIT2P7kegi7OOQnDyExViuDVCCaWxW/I4P9+jecoW9/IAR44JUEjeV789rti9QuL
	iSp0EuTKZUe6DUTmJl/c13WCr5TqAht6QRFGDSS7x+NSZST5v6O9Xrb3gEW0DV79E5QkRWmDs/W
	lL1j2WdjYmTww4CVgX8ng/rnG8e6dt6DEhuVxk+bWl81lt16uUgjrMeAq4U1LMXEyW/zuU296jF
	NAr4sW1bG+2L9YN80GM2AVxICVZS9BDy8lOnf1cGU99LRLVsEZq1mjfzzwTBek8zrqVOTzXDcpZ
	h+rReyO3j/TFWiIYGgD5EUJGfw==
X-Received: by 2002:a05:7022:e801:b0:1b2:4e2e:d95a with SMTP id a92af1059eb24-1b543c36946mr5087931c88.2.1795082920981;
        Thu, 19 Nov 2026 02:08:40 -0800 (PST)
Received: from [127.0.1.1] ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm12843401c88.14.2026.11.19.02.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:08:40 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Hang Zhengyang <hang.zhengyang1010@gmail.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, TAKANO Mitsuhiro <takano32@gmail.com>
Subject: Re: [PATCH v3] perf stat: Count kernel events in a group led by a tool event
Date: Thu, 19 Nov 2026 10:08:38 +0000
Message-ID: <179508291800.2785063.13205692423397372334@gmail.com>
In-Reply-To: <av6t6M0fUYdtXDEu@google.com>
References: <20261111-tool-pmu-leader-v2-1-3faa0fb98c51@gmail.com> <20261111110616.2249764-1-takano32@gmail.com> <av6t6M0fUYdtXDEu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: kpatch-send.py

Hi Namhyung,

> I think it's better to make the first non-tool event as a leader

I agree, and I think that is where this ends up.  What stops me from
doing it in this patch is the group read: with a kernel event as the
leader, evsel__group_read_nr_members() still counts a tool event member,
while the kernel knows nothing about it (a tool event is not opened
through perf_event_open, it reads /proc/stat) and returns one entry
fewer.  evsel__process_group_data() then rejects the read with -EINVAL
and the kernel events of that group come out as <not counted> as well.
The smallest version of that is a few lines, but it changes what every
group with a tool event member prints, so it wants its own test and its
own commit rather than riding along with the EBADF fix.

> but I'm afraid it'd make evlist management complex

v3 leaves the group structure alone: no new evlist entry, nr_members
unchanged, and evsel->leader stays whoever it already was.  What changes
is how the members are opened:

  - get_group_fd(): with group_fd = -1 instead of the tool event's
    /proc/stat fd, or -2 when the leader failed to open, the same -2 the
    skipped-leader case already returns for a broken group;
  - create_perf_stat_counter(): a kernel event member is opened disabled,
    as a leader is, so that it starts with the workload, and
    PERF_FORMAT_GROUP is not requested for the members - read_format is
    per fd, and GROUP is what would send each member's read down the
    group path that only a leader can take.  PERF_FORMAT_ID goes with it:
    without a group read nothing demuxes ids.

The cost is real and the changelog states it: in -e '{user_time,a,b}',
a and b no longer share an on/off window.

Two things this does not change, both of which happen without the patch:
a tool event member still counts through a -D / --control window, and a
tool event leader under enable_on_exec is still not started by anything -
that is what "perf stat: Start tool events when enable_on_exec is used"
is for.

Either way the leader move is a separate series; I can post it once the
direction is settled.

Thanks,
TAKANO

