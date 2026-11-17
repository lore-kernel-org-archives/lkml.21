Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953968;
	b=XaVpdLrhJRF+N1bPDbGHRHI6zB+ByahwK+abrZ7OzCMHZdY3PhKRCORzcwGNhaXi/jX9
	 vv3Tr591bpqzY29rA3ovbkuXhC9iZE0yp6DQu5mtPvPTwBFk7RotsX+9tjatUubIhRlZR
	 IB5EbMdH+1aB4XHO0ASWJUY8s8wSgBqbJ0lyikJmQH0tAwK4Cp5cliUBjny0HEn9phWLa
	 aaDWcNRBH7l4b1zOIBqmA/ny/WWZw1tP3iXke2e4ULS3aIuh/5qcsyjzrYJN/ENERFiFe
	 7DIPvzDFy4BLZ9hzPDQD0c/6H3f67GwnqREEtMBSvqRoirWmyMp/TM1NJusWNpbG9Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953968;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=rGLjDXSfgCErvBWB/bhwP3/MwrJRJcIxm5tjf67sQQM=;
	b=iRy6e4x/IbBzg9C6o0LuAdIMXEK8abKJ0SXXZe3F5n23RqXS3BijliEBwQx+uCP9WhHu
	 PobPIOvQgmoWlX0PdwP0fiymjCqs3CKJAsv7vt4qOQzhwqQ/S017DU9GdpPT75o/lNqE3
	 or/PkX/YwQObfpr93cMCqJqCqA5mX772igZRcLU2ndI5kpimoQ0lA6Yl5LO0ZtfdpbmRa
	 RWJ3lO8e0b8F8RUte2fhwOuwYpU3McBf7FOMQbrjtZkgRZlA1WhI3ps2Zn+1dhynMdujs
	 yxPKaEe5VWX2qKgTHPHGU0XeTOjtvsjz89CGk6jFg9rfcH54HAAMYgUhdrWqozP4EvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modelmiser.com;
	spf=pass smtp.mailfrom=modelmiser.com;
	dkim=pass header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=J6prgEkp;
	arc=none smtp.remote-ip=185.70.43.97
Received: from mail-4397.protonmail.ch (mail-4397.protonmail.ch [185.70.43.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF679606A334
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF679606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=J6prgEkp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=modelmiser.com;
	s=protonmail; t=1794953965; x=1795213165;
	bh=rGLjDXSfgCErvBWB/bhwP3/MwrJRJcIxm5tjf67sQQM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=J6prgEkpFtKJ2oAJnXgmSUpw8K4Q0iHXVlLMs5aI8KvBaz/lmSn0mOH7iD+eQqHsm
	 5M7JGspoPJ0GZ7Tsv3s9sdJZhPuIQvyVicWn+4+sTF3Ebe/YWVYuDH+SX65RKI9qRQ
	 zK8G7k6BHZ1kKg1GV9ZJwdQ50Rs5U54zE/9qTft4lXJsbm+XtaxIGC/vaLSrBtMPhp
	 Rx58Ng9LFvIhDZ4qi1DsgtGCp3wEeRPOnCJw46ij5w8yUwUoTOuyqr49Tj90G5pCFP
	 usQOJzfbqiFV2Vi9muz9mKyBrtOrDZGzp9Hv/wkag030hRwqUkYr1Snht/k1nsMRwo
	 lEKio1oG9S37A==
Date: Tue, 17 Nov 2026 22:19:19 +0000
To: "Rafael J. Wysocki" <rafael@kernel.org>
From: Chad Aldreda <ca@modelmiser.com>
Cc: Len Brown <lenb@kernel.org>, Chen Yu <yu.c.chen@intel.com>, Shuangpeng Bai <shuangpeng.kernel@gmail.com>, linux-acpi@vger.kernel.org, stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ACPI: pfr_telemetry: keep the state until the last file is closed
Message-ID: <20261117221910.941588-2-ca@modelmiser.com>
In-Reply-To: <CAJZ5v0gQgAAHWwS1ftxaTKHSeq1ADH7-Z6sm77d=_vWBrrkgTA@mail.gmail.com>
References: <20261110144436.1529000-2-ca@modelmiser.com> <CAJZ5v0jTHbr2KD3PXMdcOCs+QUrGrjGGuxOH7cbOe4kEF77d-A@mail.gmail.com> <20261116200935.2464922-2-ca@modelmiser.com> <CAJZ5v0gQgAAHWwS1ftxaTKHSeq1ADH7-Z6sm77d=_vWBrrkgTA@mail.gmail.com>
Feedback-ID: 232753253:user:proton
X-Pm-Message-ID: f4aa8982bb8d9e6ce4923b72fbdddd37a483ca4d
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Nov 2026, Rafael J. Wysocki wrote:
> I've fixed up the above, thanks for the notice!

Thank you. One leftover from the rebase: 3ecdc4c7d2bd ("ACPI: pfr_update:
wait for running calls in remove()") still refers to its prerequisite by
the old SHA, dacb7cef6f32, which is now 59a1090d0d17 in linux-next. It
appears three times: in the first sentence of the message, in the Cc:
stable line, and in

  Fixes: dacb7cef6f32 ("ACPI: pfr_update: keep the state until the last fil=
e is closed")

Chad

This reply was drafted with an AI assistant (Claude Opus 5.5).

