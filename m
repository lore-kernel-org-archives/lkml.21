Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205328;
	b=y+kgTbHEMp7Lf0ObZ1Yf3MnIfoccz2BUNibfwQF5QI27gT7E7fxm2P/2qBWDt0IpIl3C
	 1PP+rOTCutDt/dHnX3UzayhXxKL+TTjfKqy73L9uI2tcn/Z3erWY2PsRIoMJtjWOWJ1o5
	 OpXnNKw8qWA82CrtwY7/1P91B6oZ9BZ6ZQzc8+r6kyzvYYBHGeAJ2IQz74w5sPLBEG7zr
	 /v2m+N3jZExOXoDae9eZNw9flAdP4pXq4181BqG6pm+wFDEC8blkjRHFyMQO8a8+8Tvxd
	 TM5mw7TidcoF/OesHQkuM5EdbYzl5Qp7A2B59+VGuDYIkNnkhWO8SLAkwvF33izwfwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=WVW3AyRhK4fLgCzgz0K54jzJnV8Wa8nD6ITOxlNuPow=;
	b=Jng6pRxJn42fu3c3AulxxBr+8ABYY/q6qUKrDeMyLEN69j5bwNgJNZol0jS4dSMd6MUW
	 3XJ+nbWZ8GVwQ9f+5on3ayLUWH3wn8UIapRN0ctmw4kL0bSe8bTIN906qKA69F1sXMznY
	 kkDitXs6IXHC0DFekL08uECzi9OX/2CGb8quiSVRNKbvydiYdLqJq/sD2LMAXwcI9BgXT
	 DWbJddkHENH3wxxm2jWOpF5AnCPoL6DYk4SXx/pVh7f7Slo5EADHOt+YEPiOcG3JuvJpr
	 whw0U8BKaNAvL6F1h91QOR8B3xG96oZarwWVyjNuYB2Zoyb34ygIMl9oNQpqqQGeEcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+9cheU1;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68C860A2612
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D68C860A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+9cheU1
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b503e2a87bso14252737b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205327; x=1795810127; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WVW3AyRhK4fLgCzgz0K54jzJnV8Wa8nD6ITOxlNuPow=;
        b=v+9cheU1JvsZwxA9RJaZOvZH7jybPYzhDnqPZ32sx17gamJhfPRCBJvd01pPZnhA42
         xxSpzDJ3vQnMMo2zh97t61lY4G9ZpyGmRKf0ivg7puoCzvlaecfC8IuOtOD0Lt6RgJV/
         nocvtCWZORQPEIYSjCuGj9sHUDg6bPnW9zsuTUy2dBNC/b4788mzyklBVW2Zz/kXgfV2
         I7XfRHtmPptt2ukx8MhfawIHclfsJVrlETZYQD9Cv4AG5U7dkL9oyoNBxhHtRJv3CqhP
         Gf1Nl5QVSQj+6yu7WX/us9YTwRWCdNrkJx8D8NLVpQrEyjzLnhJM1qU6LTMJGlTPeAvF
         DMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205327; x=1795810127;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVW3AyRhK4fLgCzgz0K54jzJnV8Wa8nD6ITOxlNuPow=;
        b=2oxYyTqISMVa0qXHXLqB+nPRiQKHh+garlgvq4XvZgWiy5+Bm/gweZ9/oOqnWY7UXp
         M8k0VJYK+v+ts7L/023LHQXEM/ypXn3CqMEajSuubMLCgyyQM3+c5n6NO+5Bn2+sKnCc
         Y+iAY3Gl/4M5l48mUzoXsh9rcmbTrP+5ptMr+gDzXtC2e8mylEaypGaN6fptY24vYVkW
         ppkQX5+miLwInRLj9uZj25sL8io1hWS+1GA50djp1CMMqDrRJ/WwK5lvHY3/6iXOyfMm
         B32vUqEGYltZb4x5+ZDyhl5p9yRyKW4tv3g5xAy3rJr68Wo1fiWETgU3LIymhq0fXcla
         1dsQ==
X-Forwarded-Encrypted: i=1; AL+hErFMPvsOaCnRr9Z/GPKW5kaoGPsfI46xpzEYmYFloPFi1hFe9q2tO3JLXJdwun0GHh1MHpUdl7aSjtBzFcM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ucsZ2ENJAzIX5ipNdhT3ejZwUZmDMYp+FTa3X9n0CUXRW82m2
	IVnRYfEP3u839gv9QGWDgSH/cX7wX5HuQD1P0CnHaI8Ids/wY27bCk4N
X-Gm-Gg: AZFdTZdhu1Zd7r3G3BDD2V0QuDOzc5DJTiLf3/d2hX6t4d8fVguD5kXAsC1xw9H9PuQ
	gMrEM8dBPpWh+GMkbIB2twv5k+AGNXF0L9+9v+7ocZ3D2o7VcO61aKrfBzJHZEK4mxluJPo43kB
	2bPM+sH0UaPs/0q4dGe+1zkW2sw7+jdYZVVBXJH6StrdpRTzqyCm+lFwZBFJm65PAlPCAqGjgD3
	mWsIXsEaS1hWjyTSVHRw9H8Uy1rDx8GFZOdo9LWgoZbOmD721si/KNO93qLANFw1077AABqrBYk
	UUGkJGIGruIpk804LtRuqnwOCiBCE9CUGm3IoNq10B0ASWMmJ78b8D9Ddy/7ibco9aPcm8WMJwy
	12IluuThKvR1CooZiVdTndJu+wnAArYznMDxMseaxkKHfItAJXZYButRzpnocxJUsQ1AFnMZtyw
	34rcc/uZfF/n2GoRUl2jHKhEiJz+yTmxrg4mGRW/dYYGL7EQxqUHuc/TqiKglx0p7O7oyU0rUvr
	Ea/AvJJBVZcuioh6GhYPxq+Mcb00TKhjqPeIjSYVJOahjaQpdoUaMWwiavzlqJNi7Z63457gJTV
	LF01j4U9ELl0F3Dgfg4McQN/Njn1lJfxs7XCae/0b8tRHFLfteukZwbQCKBK4X0JNUd8iIAINh3
	gwgC1Lv3K6dpLel5hoBRJfEBSHee8jW9qDAIS0WPMCFSByKOKs/L6PPI508K7yECfFVM8WUwKke
	dAgWcuZai8n/vJxgf801cN9Q==
X-Received: by 2002:a05:690c:c96:b0:8b3:3fc5:2be with SMTP id 00721157ae682-8b520443c66mr22255077b3.20.1795205326668;
        Fri, 20 Nov 2026 12:08:46 -0800 (PST)
Received: from lab01.myowncloud.network (c-73-207-82-134.hsd1.ga.comcast.net. [73.207.82.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52035bd70sm17687717b3.44.2026.11.20.12.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:46 -0800 (PST)
From: Amit Patole <amit.patole@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/tests: add KUnit tests for the timerqueue
Date: Fri, 20 Nov 2026 15:08:45 -0500
Message-ID: <179520532525.3434626.8560089921289265644@gmail.com>
In-Reply-To: <20261106-kunit-timerqueue-v1-1-1913a0bf2d45@gmail.com>
References: <20261106-kunit-timerqueue-v1-1-1913a0bf2d45@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Nov 06, 2026 at 09:01:48AM -0500, Amit Patole wrote:
> lib/timerqueue.c is the time-ordered queue behind hrtimers, POSIX CPU
> timers and the alarm timers, [...] Neither has unit tests.

Gentle ping on this one. It adds a KUnit suite for lib/timerqueue.c,
covering both the cached rbtree and the linked variant.

If it should go through the timers tree instead of -mm, that's fine
with me, and I'm happy to rework anything.

Thanks,
Amit
