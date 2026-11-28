Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795867089;
	b=TZNOVsvzcFi2yYKHVTaRBfJaUlWYllpvrLprz50i23jSJYqmgriQdBmO9R0VbLBl7P0q
	 CyU7ghajtP3lf6NZWJweSwlkf7Qqk8JQvBbv9V87fljFiMbkh2ZqNEFg1AaOlbKSJhfy3
	 s2dMHhZ6lz2Kwe9aZdTcEpe5VQ6PFf8ndBlL8gGXpH1CIuBqWUsddA1uTMMb2oCzG7OcI
	 gtnfbkjFVnA34PziRnq1JUkMy5xFHxZpqoFuPrr7GakYJSuWQobd09L6vTjGWn19vlucc
	 hCZa+9Wm1LQsjaLDXUJpYhgf6p0qsmmcKbrBW+S+u1ePxiBF6e+swknxW48r4VKH8zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795867089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GW+E3bPc2TThHWvpV/0v4yXlrciAMENWcJNOY9IP/SA=;
	b=P295aGI2oT8YeP/5bYQRIxiudsFL4CfAe/kTizl7rjnKGWKGxtfkm9LYoA/LymdNkZM3
	 heeAdc4RoHTSnwpqBZaOaozNPZIUaw6c9VSYAuXmV+jygE/tVGQvnN01CHelKXJKCJsmd
	 C//IgH67q3WEbw4NfCyDeYEwggfQs2JGspO/1ZvEj+hGC/dfYZrxTooFU9CbjcWafpAIg
	 nDdPQQpiB5XYJLxoHN1wcb3x12b/+jrDjui3C/c52O6kIhaLrc84vDm94pHuv6pGhWNfC
	 8H2X7BTOpr82CzDLnsmZEGWe1qLBWcHHmqEmYYJmfs1ndurE+izBchIScCvZo3a5gKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sNkZEjnh;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87213606A323
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87213606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sNkZEjnh
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so86267105e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795867087; x=1796471887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GW+E3bPc2TThHWvpV/0v4yXlrciAMENWcJNOY9IP/SA=;
        b=sNkZEjnhp3GTM4CXEAQshh04CGEFAIN/ae0Uy5QIvGeEcOF3s9aDuMJ6oiiD1m/Pw9
         TdCB4ngQVnTmBSmwlUFxw57SermbSSJer8fYXwyO4ys4hJhQXKmCDS7APJsQ0aIVmLhn
         GRfMqma4mHYoKznAEsmJ63fAAKcl2n2LoO6PpkNFaz+z3hbVPm73Tww31XLgp3KHwBOp
         3Cdv0Z0K9Gy473USJnfWvNb5OH9p3mPU+PKwCtJ+UeCOlmn7AsJ8vSQI7uCHoT4ZEy3c
         Z2ayxCXXoFTcX+MwT5xuk2QG72HZKwHZKBAUYELPmNeYa0YYsijNAMzFpdUimL278IM2
         z+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795867087; x=1796471887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GW+E3bPc2TThHWvpV/0v4yXlrciAMENWcJNOY9IP/SA=;
        b=qd7P0IshVC2Ap4FTjyonkKFb7WZR61F4KrDLhOzPt3MloYUmqh1M4EGNVNzSBWyGT0
         +zT5o5ckj8TD0nwnJuTwxaBXlNAc9NGWQsK2jXBAC0AEi1bMnfhyqD1zTzzu16o/eEOu
         DHxI31QZQmEKNrYSYqtV6VSOFuZyE5Q0cQQpcazz8XY8kvt9zgrQYOchRr1N1zh6XF2R
         iDp8idumq6HKkthEqxHjBfnwmETlu1Uj34I41q4qTdOExRDmJp6qA76bo3o0CJFsMwuQ
         mvVp2/r4DNinOoOs2kE+AS2RMfhs70APJLNId+h9Bchz2KqO7yTo+PTyrEBbvEF9UmDC
         OMbQ==
X-Forwarded-Encrypted: i=1; AL+hErFbczRCSifAzbrD7l/Cf2n9aWTs44YcyvmHnlwVVRSlI087024sftKaltAspfFfr6JJodV8DLOVuQODe4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Trxr9YCCQ0R+xTV6pXaM9qBrxsVRyp+k6rKlARSA6H0P1iOWr
	wdYn12DqSbFAxkyAig5k3PuBwl4aX9PXoOOF6hQ5GjcVdR/5GDao/EE1
X-Gm-Gg: AZFdTZdOOJmtbgpsL2uY0qnv9kHjlKf0P3E9eXHtuUiASFQrL176Hz0z6goRR1teiWN
	6NHFjXx+1sScS1EnyW8Zn97+39L8wJI2z034fn06vrtwbC+2fIuLMbSkiyPupWg65Gp06DMue1u
	+1N3/v+oL3AOXptZuQVVYMJBcldww6XUDtmBE7zyxm/tGB2xXUBeICeCxUGYaZX8+9b8iBHBSWz
	TgzLaoqHvDCH32G1dgU0WBbHWYMKBqIFUoBoQQSDOSXbyglaAE/7cr5PEoG7MFGIODdHWOYLvQK
	B8ZhKC7jYxO5ffC0Vl4ZdTSbuUfRMfS2nW4ZaFy5NzfPXxXb99JMe1TTmwO6Ach8F/4WaqTsb8/
	n122/UGJI9ws8cFkTNY18JRJvZoPEH8ytCrlqnOVVnUVagLzqRFClraF+tgNClmejiI/5ihtOmI
	x5YQxOhzNaTRfnGTI4oCePXmtH0lJ+eGxdKWxyR4HBUnRIcoOv9AxqVkZ7uVPI3YPJ9oDodUUv/
	Bp9NClpOUCxBqMhyqOsHyFE6Yz/iTWIttpUh7cy/daVeHZbIcMdriPAgNxbb95nAziUhq6Pu8jG
	gK1dNOJyT1uLFQq0pBviRntM3E4VaSWednOVOFC2JgaHe0P7pql28GV4INX6HzcdVspK6LrEv2A
	JEoYU3CCwTuuGpPmFwULjWO7Ef07mYJlLZWSA/kP2VaRSTKh0kbTaRbaaKq5Lf+HWhJNj8vUAek
	ptOH2Q7be6ii3Fw5/yt1Gmisd2+JIVT4rKMsiIQEYDKdfmEZP0L4MSC1NYI2cUZyvVMlpDaegvu
	N+/eF19tBY1iqj55Q==
X-Received: by 2002:a05:600c:4f42:b0:4bb:5c5c:8130 with SMTP id 5b1f17b1804b1-4bb8881c726mr704270615e9.5.1795867086690;
        Sat, 28 Nov 2026 03:58:06 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-510b-18d1-bc36-7cc9.rev.sfr.net. [2a02:8434:fda5:4201:510b:18d1:bc36:7cc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm832768435e9.14.2026.11.28.03.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:58:06 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] tools/bootconfig: Fix tracing settings export
Date: Sat, 28 Nov 2026 12:57:55 +0100
Message-ID: <cover.1795867077.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Masami,

Thanks for reviewing the earlier bootconfig fixes. I found two more
issues in ftrace2bconf.sh.

The first drops an event's enable setting when a histogram depends on
another event and has to be retried. I reproduced this in a private
tracefs instance on my Ubuntu machine (7.0.0-44-generic). The fixed
export retained the setting and replay enabled the event again.

The second stops export on kernels built without the function graph
tracer. I reproduced the missing files with a fixture and checked the
tracer-enabled case on the same Ubuntu machine.

The series is based on bootconfig/fixes.

Thanks,
Eduardo

Eduardo Mucelli Rezende Oliveira (2):
  tools/bootconfig: Preserve event enable state when retrying histograms
  tools/bootconfig: Export tracing state without the function graph
    tracer

 tools/bootconfig/scripts/ftrace2bconf.sh | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)


base-commit: 56bb11fe6aacc7666938e8e6765b44aa0cf1fcdd
-- 
2.53.0

