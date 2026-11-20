Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795175086;
	b=aowM2/FykZf7YgF6DaRJEzbgE18kGvWcXx6e2k8GX/FnaHJxIKWyQaBJGz5beOTuqzWf
	 3zdoO1lYNQf45TIPAUvq+5v0gl8Ij56fZ7Zj40sV6HUheMg3THxkDkZhqSr1yBBqkW8dk
	 //KXwIOk31KaftGBp57VN5hdyJUXUaXr3dLbFPWpr8a6fNe40MR3JUjHju06URQCHrCLr
	 oxhTVP8P+158/xdeeHzlXaMVuX/jcUQrC+UaTV6IV/umEQwV6GDuClLUFRrGdFoM3pdi8
	 BstRtW9Qu0y499IJKi3IQlfzt1s0rJ9kbw7RoqHqkt2mZg8zV/6/sGfq2y3sWJVFi8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JC8Bc6cC/0zXiuAQ2eEDZMlg3ki7dHtSWqsSjDIl7fk=;
	b=dtyoqI+oJW5oNeAGqW3tEwnxbG4KU2N2XqHsoETVjwtJrY7gaYBP8x6CyhSmJw8QaM6B
	 ztLPWmzYzX1UlZNvUhOdO52H6nv5OcP1r9aw49mDqZAgofwj+B32TitfkyXaSvSDyLeb6
	 McH7R7xcx6eDq290/rhmgnjrlXGxWYpqmS6bkR/1Zab0Ulo0tfYvYxWUwk7nUtxzPjYvW
	 xHkzMFlVujq8lD4T8qUxLlf0EiuwOhf5znuT0W3tNcR2jNT4EHd5rVVsNg8+0SIxYcCMJ
	 do5Ail9DdXnyV23b47XeflzM8dJxVK3OeKbBLuU1tzbq/DDIprAffj9wrTTKYZTx9JQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8qr+BV4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90E160A2608
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B90E160A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8qr+BV4
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67da564d9f2so1313731d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:44:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795175085; cv=none;
        d=google.com; s=arc-20260327;
        b=g9O/701p+y5Nd+RRZB9af2VoHd5yr1ohvlGk4S4q7wiuP2vYa2fzFixATfWqvnfUlQ
         +/0l7XqsvJKFt7CF7326anF0RL9ejdIOfTVCcJu8UdIeh6Z3WNMmpE5bmfbaPvQ4EaTd
         MohSgaUjrXxufe/LLqF+xazAfGVZ6B+5jF9HJ6WA8CB8C5WlV+YKyTr6kKpOT7GYJEPM
         jm5PHxferTzDScg2ZE/PzITk9S9G3Oib/ylBf2JR51Y+5YgMYU2eW5qeOvYyVGrZqt1w
         fv/Yl7IR1mGS5EOldTRCVEb54Az0VHQ9LnmsvsYCPjLXM08ObaOL0vi9ZcICa/IEhy8J
         SXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JC8Bc6cC/0zXiuAQ2eEDZMlg3ki7dHtSWqsSjDIl7fk=;
        fh=SVDa5r4CR96yQiMhiLyhwB+621HOCdqOrbLRURsDfWQ=;
        b=OhMeESakf3cP2LwnUFAPgAeVzhFy/tBbH7FV7CgbGMwl+3s3QA9XesZeeMFfqviTis
         bnwDqzz6to7swVtJc4SSYjrpqhNZzPuRdgdQbhA/h0qdEUENzSASZy91boZs8lIk2EeC
         gP6PLU9+7eTnoNdHviLSkgub50LVn45eiFKwZ33rIYjGMboiJhmXosUBdnISouFGS6j3
         FA+Qcaf0CYk1N+iBPhKcCnbonECmm03WFFL516WITBMoK9iuveT/S4XIJIpXtasbBRI4
         G/evEtwaa8jbciNq7eRZ31neyRTwSJ1sf0kb595e8x5ymdp/oPO+zTYEjLwu/UgM18p9
         mN8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795175085; x=1795779885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JC8Bc6cC/0zXiuAQ2eEDZMlg3ki7dHtSWqsSjDIl7fk=;
        b=o8qr+BV4Q8p+au5ZaFC2VAJMb/RDXvGx2fKS6AjBwU5Gya+PALbAa9dtL5AZ3lsSl6
         7gaIO1bFU2/bmGUPxhBsi48FKTpEEmT6ohsNf61sJC4iLdKZEmEUGW6cnhJStMtE/yLp
         I5lgEnTdIuwpgrEaJfACMhaT0bZmZ1izzIFaM0btZShadap7lq6gurVfIc1V4SH/4nvM
         VP3tr26W98u1jOvA/34WYR3PC+MxZ8aLO94XM9hBlug3CJcKPrJ3jPAvuFGKP9j2PNKL
         WzW46RHYqM8O7uy/PUUBUTD0I7Vy8agX4a0zoffBSh4AZAb397o2E3GHOOJZ9fmqRqIx
         gu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175085; x=1795779885;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JC8Bc6cC/0zXiuAQ2eEDZMlg3ki7dHtSWqsSjDIl7fk=;
        b=YHLZ9jttTE0c1N7KDJqmjfYowOW79irD8ARXxl5hNFB/i8xwJGFZOY75O32ImZTZm8
         Gl3SuX7HqfGS6upNhyQPr7kSWJCMEo+/iPOTM1eBLb4Tfy4FEPq2cQDmDznYFpWSp+YY
         nSLYdKM3Y4XtJa4RmGO1KME1/XFRDI/4Uwfda8acCW/qZEppTnGDM5NAJDtKnlFGuWNZ
         CcfU2O+s+2qNtza1stSsKcxfMzzs5muvSHUWUJ1EnwSTvRHf7FORzHqeG8f5lEQe3wY8
         AcIvj8ufnbsoGSUYGY6RbM0jg4mZGV527819WMGb4KwLiHxmybFMHKbKwDacTBEsToQq
         zEpA==
X-Forwarded-Encrypted: i=1; AL+hErFKiKwQty6LPumLW55P3JqYa9LvPDMd6zxu4/CbSp2NnLSB3ud13ieyM+WZqRyN03P9dqxsO4pJ9mEpxO4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+R2RYMWkfE/Yd+GAZ2NQ8K33nlb6hft5Z4gto27dod+4Zqq2e0
	7OjlRsS2FCVqOvGxw1/tF4gjYLRkvtTOSYSqnCJJLby9+sMG9SAnF1QMofSE9D+vTA97oUhmFYG
	M5C9kJH/UmudjLe3g+zwOncpy737xqo8=
X-Gm-Gg: AZFdTZdVOjum6LSWUGo6aw+uVvSvw6phcL30NOEycInJKlu2N156hdbeE9YyF9lSyQ8
	Eqe6zY8Vf9DJ7GoRC+hCSvi53IvobjpiOLwTc0D1TsV112bPwhVJ8L9u3hmx1P/WFL54O5PcfDv
	ZlIHru74DV28kv7o6jZRKrkAlpWpEJSwQFA7c74I3NJnEBwxhoe7frRz33qulM12S5g5w6h71dB
	T39Ta8nnzcqzGvWo42ej6fZjgETGzeHq2xxh2IbpXH2jUcC9kupNtY+9asn3EuhzD9zAtDtdd97
	FcMsxEuUr+QD6RYcsLUG1X6qtVd0MeUfyxbOW4ZS1fq+2LLcpsMSe6P4jnW7u1pUdhc+sWjemb0
	8qlb3Ib+VjfXdhg8HP1WMhjROF2fiHPf+wzI=
X-Received: by 2002:a05:690e:4881:20b0:67c:1e14:4fbc with SMTP id
 956f58d0204a3-67df42d0721mr858402d50.11.1795175084774; Fri, 20 Nov 2026
 03:44:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104205108.1041666-1-albu.victor.m@gmail.com>
 <20261105202110.1081296-1-albu.victor.m@gmail.com> <2026112048-dimmer-ravine-ae33@gregkh>
In-Reply-To: <2026112048-dimmer-ravine-ae33@gregkh>
From: Victor-Marian Albu <albu.victor.m@gmail.com>
Date: Fri, 20 Nov 2026 13:44:28 +0200
X-Gm-Features: AclHuK_tQvLq8m0AECgKZuYHhvtIB-hn-yFwix8vwPvtNzJv1iLXLnWfdq7ZoBc
Message-ID: <CAE5KA-PZzGXhkqwx27LdEFxHv0gHN83p0k4gC1NW0TQqNRyTHg@mail.gmail.com>
Subject: Re: [PATCH v2] staging: most: dim2: add missing Return: documentation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, christian.gromm@microchip.com, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	parthiban.veerasooran@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I added a Return: section to every function that kernel-doc -Wall
flagged. For some of them the comment already described the return
value in a sentence, so the information was there, but kernel-doc only
counts a Return: section, which is why I added it. Nothing needs this.
Let me know if you=E2=80=99d like it changed.

Patch: https://lore.kernel.org/linux-staging/20261104205108.1041666-1-albu.=
victor.m@gmail.com/

thanks,
Albu Victor-Marian

On FRI, NOV 20, 2026 la 09:16, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Nov 05, 2026 at 10:21:10PM +0200, Albu Victor-Marian wrote:
> > Add missing Return: descriptions to functions in dim2.c.
> >
>
> No, the descriptions are there, you just moved them around a bit.  And
> why?  What needs this?
>
> thanks,
>
> greg k-h
