Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098689;
	b=plAogL4nL2ZD8J96Qp1EF4Kg5lHZ1WPAgpAz/xm0zeEvpvo9N3EDU/GMzjiwSsdLjCcI
	 jAEmTIrE44uAxSsLVkCYa96/HKSyBO5Ezcf1zNZN+fUIVBfaJNNF4MuGjO6L2ShG2+kz6
	 JJkizjfKBhdnnIVaUki71EUOMbMYfeMkkfIvg7+yuNxcRiMBO3MZ5liNOz7hH2faLzgZ5
	 hKt81kdJ/3pi04/Wn/RcAD7XSVGIvQAUnaskGSBB4Kw2juDyYtYZzM5Egy4aQo7dM9BEG
	 tocTRjPIgqE0FRu6JPu8SSWi1go1H28p3S5PBYUiN1QrjkmueBlgfqIaS0HrJ6BUE6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098689;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UGyDRQhGJp0sdAUdRryPrOXSnYzvv6R75u6YYlxIRuk=;
	b=t+u9lVVQfGLqbecPvZuHpOsk1dnxyvrdFSsvXAgI6CE3Kswx7Znb3xM6MdSgN5JkOQFg
	 fQ7WfsWDTEF++4QhcRV4tix8t3uukKMcW/TVtcdlRtw51lO/1AhcesTlps5fCcKQDxlFR
	 BE2eCzVnLmmyXYEsl0K9j1XPIxH6j+kpUMbCWJlhJZh7rIGi0D91cHae0TP8qhMTsNO2E
	 smv52Wp34nvfzVobV1GxwJntnJE3PVzr/4oyE7Xiu5iWIDh5g/Ob2YfGc7jsq7mHbayFV
	 tJyL5dUtex+aU18MxESox768rzPkXTG8YGJWe+yknd9LiCyIW6rrsoI7YJymwmIBQDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PmUFqYHA;
	arc=none smtp.remote-ip=95.215.58.193
Received: from mta1.migadu.com (out-193.mta1.migadu.com [95.215.58.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D883606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D883606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PmUFqYHA
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UGyDRQhGJp0sdAUdRryPrOXSnYzvv6R75u6YYlxIRuk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795098687; v=1; x=1795703487;
 b=PmUFqYHAo3CCYv9WDhueuP7q/ydKzjD9jRwuw+yYf/TnrEZUuxSDx1v0LTnPl2Ph27pGEIpD
 /to+QCRDHBPry+xD/6RqTGjS08h2vL2gRdMJyuGfOe2xEMvYTFxaDyzSbGvbblhTf+z06lW3oq0
 a+OcTgknkVX2Fw6oUD3VtQwY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 29c5f9e493d311f3;
	Thu, 19 Nov 2026 14:31:27 +0000
X-Mizu-Trace-ID: 29c5f9e493d311f3
X-Migadu-Flow: FLOW_OUT
Date: Thu, 19 Nov 2026 15:31:21 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Sascha Hauer <s.hauer@pengutronix.de>, Zong-Zhe Yang <kevin_yang@realtek.com>,
 Tzu-En Huang <tehuang@realtek.com>, Yan-Hsuan Chuang <yhchuang@realtek.com>,
 Kalle Valo <kvalo@kernel.org>, Stanislaw Gruszka <sgruszka@redhat.com>,
 Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v3_0/5=5D_wifi=3A_rtw?=
 =?US-ASCII?Q?88=3A_fixes_around_the_firmware_recovery?=
In-Reply-To: <20261117171003.1840491-1-mehmet.fide@gmail.com>
References: <20261117171003.1840491-1-mehmet.fide@gmail.com>
Message-ID: <CF888347-648D-44CD-B7DF-243213F96737@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On November 17, 2026 6:09:58 PM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:
>From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
>Fixes for what a firmware crash test showed on an RTL8822CE, and for
>what Luka found in v2. Patches 3 and 5 are new.
>

Hi Mehmet,

I won't be available today as I am going outside my country's borders for
some trip. I will take a look at both of your patch series and that RFC you
have sent in the meantime and sent my comments when I am back(I won't have
internet there).

Best regards,
Luka Gejak
