Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937517;
	b=d+MBrioNSNFRxUu/LFe1tOpO5BA18Pexkoq4tMpnf3YmIVT7frb0t2XrbqjNRLS51Vko
	 ZBAZIidzmscTPTx2uMkXOvkXfJ1Wux5LEUKSJ3KQxVvzu6+/lC8PHpNibhKuZGzBn2iBP
	 b8bD6VuNMQtlBwviJO7IMiNdaa2UOZ+uenBBXTuCD8eDt1WCnkKzldjvd4uwyi5wiPQLR
	 j9qz/g8r089lYkyGX+9qQErEj9xjO6ezvJC/hKZZy/tQKSci+kfRpzVwSRh9SZs8zxSXK
	 n0cOxJcnnffH8tJWOGNPxEbmaeMAOg4we/n2jr12hdAvqZtO4hzae6FJJ0Rx9thxwNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=yKaMzWXUwfQ9LI7TbUbNbChNZvqrpOopz9IXAJacmMA=;
	b=gQB7XWBVDSiz0NCdfolEgvgnLuO7kI06pWW42K5v51MiRpRZPEQQOaw5bmu2G5saMrpc
	 RsQMQCD3J1WSunGuGRjlzfp0S92GRKDRMCUOAvJGB4cCUYDsMxmhGfRtjLaTRqzi6S56H
	 8LjLwaKVa5YOFkybcIcls0qgFUn3DDDuWxxRjUdcqFYldVB1CGVjuDRrigKs5o3wm88jN
	 qpfa4NmFzljoxn8DS+2DfnhiEyJpSltxBSdeHnI6wgSzjYZPB0D5kvlsn1ADntEJDOOtD
	 w5onxuSe//XlMK+vg69uh6tJbDRNtMG7gCIPgjrxaGRTsDWfYfiM3Xb7+oCYyeLYkoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=f3Xcnf2M;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655FD606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 655FD606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=f3Xcnf2M
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3acec6677so117087c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794937516; x=1795542316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yKaMzWXUwfQ9LI7TbUbNbChNZvqrpOopz9IXAJacmMA=;
        b=f3Xcnf2MvPzC7mGFrA2/x+siBtJv3kdjLI9oPMWZg5WpGdoXYKIhlnwwYE1EqRarX9
         ojz3PQYDxE8RG97NKJf22aBzjVRUCwouSwDuyn9szPZTIzs2HLfPhmutHrhJiFqRJ7uB
         hund8sU1v9zOz8m40T0BeB9RXAU73L4WDfLXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937516; x=1795542316;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKaMzWXUwfQ9LI7TbUbNbChNZvqrpOopz9IXAJacmMA=;
        b=1FNKWJEgu1LttHjsptnhXMAB1skirJEXpffbpNGe95ucTvVJepXJGJ/RGB9FS7xnfu
         1AuBrzUQsmwvggHahgyiRLcUPe7gaIUDKt57zorYXQtfpGpq5asKTKO3mczWUXOZxrah
         qXDsveF1k7HKio0Lk/WbZWsXs5ZbzbXQVftw8FJ5LkmxB2e0VjQULmXIeTdWCKhN17+q
         JZwG16BgnmXizKVwBUqjTl66dnUQkYsgHMFhNqMaQlqCuXWKIsTAcn8udKMo9MqasQsE
         BzitNimpdY4ueUz5zkB5t+LJYDS4U+EA3Pk8fbRXbmnCN170joRYHnzh76+MqSI0gcEr
         2jTQ==
X-Forwarded-Encrypted: i=1; AL+hErEuNgIJ6m4CciBPalebQ8SZnkbsBjxFO4z1CiaFrQIV1RHR2FjenRcOHwJYWuKUen/M3qCitcB4PnPemL8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hq5OKgxuKaxT/aYSkocI65AmbUVPsa/VeS42QK6nc6V5IiQL/
	g9YzHUmVAaogbG8fG7EWUo/Tqoj1RYXfcQtRqw6aopvdvSLSMvPKa4c0eKld6AJSGD3qgUgpUH7
	O6nk=
X-Gm-Gg: AYBFou1Av0SxEYFEyyJXJR8FaYVEkmgqMZgk4FOIz1oS+1iH0UqMUc4RSmnD3zwZJzP
	TRDMY4/YU0/akgxcO7smcpGNSVV1IPZymBr+b2g/S731UvplezjnPVlf5f8a24C8tNyNVLWL9Bc
	D6XBjriAGdhd6XUoEPEFLtK+w9w0+amxeClndba6WFMefccWDayDSUSuxDOLvKIrxrUC3cjhEh3
	cgSJA1oWDwiBPC3aT/Ww1np3+B2Y0i9fVPP1pPTdf+68rd0X7NEr+orCwsbiMql5E7dsfcj5EgW
	js32lyflfPnEHc+UOJE2qiw3COu3s+jHKxG7vAZdqLQuOunDsnaBBnHB6mia5y+E4e+IwTxeDd7
	s7BO3q3nJh1394mLyMfrKXqG9bCeFq2yMXenF806p9R2TEbmvg9NnqCab4y0zZu+OXoFbyX8ORq
	mJxLdqRMDp16LuOjSXNnmXxYONRdj1ZHeoF+MlkvpRzRRXxEaxHikeHOjAuMb7Nq3X/4Y2WVSrL
	8Ux34oXeDGe68ZY5fS8GKAZ9N983fW7xNP/ZLHnR/KGxGWAfSpZMpcpny+SFkEp9u7HrbeBP+LX
	4ZPOZLyLvjV9WPxuJOAhIwczgBdE7M9EX7tiVGfB029QBnmzrZHLLQLkltt60cz+3e6y/gYtQd6
	LDC4cgC5D2hfteA==
X-Received: by 2002:a05:7022:f106:b0:1aa:47e7:97e3 with SMTP id a92af1059eb24-1b543d09a91mr189552c88.15.1794937516309;
        Tue, 17 Nov 2026 09:45:16 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d92d:531b:8d97:bf51])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b524049e0asm22060282c88.4.2026.11.17.09.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 09:45:15 -0800 (PST)
Date: Tue, 17 Nov 2026 09:45:13 -0800
From: Brian Norris <briannorris@chromium.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH] tracing: 'select' GENERIC_TRACER, not 'depends'
Message-ID: <avySqRwpInSfLIgK@google.com>
References: <20261116144652.1.Iecb63200dd245f62032a3b1f60ae78cc48868094@changeid>
 <20261117085317.4ae87046@gandalf.local.home>
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
In-Reply-To: <20261117085317.4ae87046@gandalf.local.home>

On Tue, Nov 17, 2026 at 08:53:17AM -0500, Steven Rostedt wrote:
> On Mon, 16 Nov 2026 14:46:53 -0800
> Brian Norris <briannorris@chromium.org> wrote:
> 
> > GENERIC_TRACER is not a user-selectable symbol, so it's impossible to
> > enable FTRACE_STARTUP_TEST unless one also enables some other symbol
> > that 'selects' GENERIC_TRACER for us.
> 
> I believe that was the way it was intended. The selftests are to test the
> things that select GENERIC_TRACER. Why would we enable tests for something
> that isn't enabled?

You may have discovered in your other reply, but these tests are
applicable to code used by EVENT_TRACING, which can be enabled without
GENERIC_TRACER.

But I do see how this still might not be exactly the right choice,
especially given some of sashiko's comments.

Brian
