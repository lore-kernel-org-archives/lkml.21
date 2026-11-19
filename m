Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795069961;
	b=Dy1f1P15nn8s5or55g+GwbkEun99s31WbCIl9yHRCNDgE6D588pNMJetm9XQ/LkmzHOl
	 th6UmsSJOqwxefKmF++cgiD53TtHDyG6HEGJIEaSfC/DGFTRlS6HhtL0z7P3C9xmpAUZx
	 jlr+Fupqz7NyO/FmwiDEzbJQ80FfcBqa4U+96sskxvUKlXOh9UmEB+7HQS9FSiNblntDH
	 PA9R5KfSjw2syxVuDGZgFBMTEWNd70eTKs1hoFiuHED3hnp8L4ssFink4Fhu+5sf/GTzS
	 aJUm6STeo1s0SgQ8VyZTfTkUAQLTkTWNqTdJqetanhH8bFdf3CS9PcPoWHvEYBgfNBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795069961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=kxV6lqe7HwKB+P7LT88Ydq7YjplBVGfV12LwKaDDBYw=;
	b=HENZWZIOdV7Jw3Ch/nXUOiyuLLj4f7CVy/+BTHmJ8Nw75IrYboiquFxTerHtI7HZoxSN
	 FbMaY1SY8HFI9bLk3bm4UAMXjrGzuXDn4d9K5hNbVSj42v7Lq/NHLnvNH6Y8AC9bcN9qn
	 rxSd6QEkdB3UGDPseiF5N0ClidF4cLseuhwSSa6shDN5XhIhFEjgI3KInbPevfobtyNIi
	 atyFl45n78TYR7znScnjbt4YBFg/fmFOoaYX9jNM0eS7WoeKOGxR8JO+y187pSxYPJZsF
	 DJFdt+CmzVX3HZa51gnzgxShOXSpNiqSyOkxFg+5p8RzTb5wIvGSNp3jTNRRgUrTnPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P1Sup+RU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49B8606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E49B8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P1Sup+RU
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b8a52db5f9so1710824a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:32:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795069959; cv=none;
        d=google.com; s=arc-20260327;
        b=kb9700RCzx7mJ5kSj0NORz3Ehrs6woSHr4JpCeE9/JqPE94vnaE9kB5hvQflWAJSli
         dg6qctTt2S9hwwetUlsXDzU/Fky1UTS2OTEsK5F46/tDuaaSknibHFMuSweRNFl1UXR3
         CwNDnmrIPgeGeZmFwkD/2lP7Zm2KnxkpGDgj9iKeSthQivQ4AlWpethkvbphT2rGcwLp
         E97OEA02h2vZDxOoS7QfTRMTgnCOKAOpbFzcY3b24JJpm85IVKpMo4w1QRex3+ldxXPP
         0ZjWLdbHt85mDB0RGAYk520I6jgUVC/oWwo29tk2jPlFAavw4B7d2gv/wYHLkj0v2sPA
         Vjxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kxV6lqe7HwKB+P7LT88Ydq7YjplBVGfV12LwKaDDBYw=;
        fh=V9AeBafJgTW96HdC48wsxGAfd7Fe9P2uAL8tLCjpUN4=;
        b=TT0JADaQTUhlPNE6NNGI8/iVGnNNWgZRF59bvSrD6L3Kqt/bNWlDFq1UeM61Ajc6Ls
         2pORWN989LVhijKBjf+fbXcNO/xi0iX2zJ/lY3ouxNcPZOfIPuSyFDa3/DSjIz+yBg7x
         IpQnAmBtuHpLn7AWsVzqsUEPCtzgZSEUX5DIWHxOBKX6YbI8j5giqc4VVoJW6/YikxwD
         gl2h5EyaI6NgP0ru8yn6DiNq0faLKg4DI8oN0wcCO36JG5n2rfGUZF2u7MxNaK2q+zLn
         XuEtWa2642/l9aYJI0Mrj+hTXXa2LauavNj4Cs/rcs69hqm/sN4K3zA7KI0rVl60PRDz
         3qJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795069959; x=1795674759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kxV6lqe7HwKB+P7LT88Ydq7YjplBVGfV12LwKaDDBYw=;
        b=P1Sup+RUWMjceHTThfrMQOhus92ni7q9tRGMA2TtG/S4gq7MXTdY+GxPL9Jw4Xpref
         T5sxDWsFMEvtEKW/Qi+FYsPeUSTPAaqTgR/WIDUg7zhDaOPQ6J3fOPHSsHBRj2xnQbwl
         BAmSe5mK47bmjAp0GX3iTNPoxsLMiwfHZUWQfhosSmLn0eP0xxAiTxRI7FWoxjyqmIH1
         h8LEcsCDm/jwvGAoPK9dbGLWhzIeVEGIPZby4RCv1TAjEk0gjCfkhDXR0NStTn50jfIt
         IFbUVnq/q7tj7Kb1swSYBCNPyjBAzH4izlAAKbetfV/So14CRdhvmg6nUlFowzcf/6+Z
         1n7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795069959; x=1795674759;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxV6lqe7HwKB+P7LT88Ydq7YjplBVGfV12LwKaDDBYw=;
        b=x+cB2S5mDi6PLl2DP1kZhT/57i0NR+J3jgU+XzVgbp1NqMdUmf2fPSsBxF/C2+Ut71
         WO9UJCIOtBXm7x8wqCv41+WsW1kmowKkO2EaMnL1MH6NdAH7Ssc8Ybl+ueBSxMjciaZ+
         vpcPSs5g+mVe//JGflEQxlOWea6IPZnaeNawFI5MxslISwv52aU01ckXUJ3DVjueSFmP
         IieJi3ioMKOe+dn5EdupgcAlmlKYYJ/i5eBg/n8BMX5FF0SL3mQUw67gQH0uCbebnaX1
         5IAWaa/mTW9/O+b1mobpb3LWz8smwaZ0I9au2txeIHMb6hx7ZRk/9SXbyIgMJFRimnJ1
         OiRg==
X-Gm-Message-State: APuU4Z/Or7UcU9fom42ofDNg0miuhN257lyEP6qmoemor8yzD3u0I4ud
	fN58FMYuHOkKuD9QwA3yvLA24+a/Sc1QsQZaAN/1Ja4HR34valMNmtaC7MbxuMWUUQvKRWurvzr
	b4dJxl8Mlm8IMCoKbGgtMzkwvw35Vwhfg7pu2
X-Gm-Gg: AYBFou2yV4FTRONti2PzQ242hIVuUK8S5qK0Z/ndhPbldC+8U1jG4HWM5X260Nmhsn/
	krvmTuYPvzaqRi/hbWm874ci7J1EBDSoFp4fzeMQMpiRFcZQxTSHLU8Z0nsiMQcEX6KYYj+D+zA
	ZNEF6ObqoebqFlA2xA1cIu6bVlNe9Y6a/2jTx2VUC2ZJDaJzxcJKfobHPnCdHqa2+H81cmMtn/f
	M0vFCDglYpSTTgViRlBeNuFCWi956s0pqTTAJV1jIdobwZlmGDDWJosgn8ezsS8J/TTuxACuX7p
	reYjEmjCP5zsly0sse+yB53+vH72MNDjTKAB82xRhKwrjEIytPnO1SbXd6y4PlcVQG64d7qItlR
	RgeTJ38RQCL/WfYgxGdUeXA7E8cSINxfx99ecoqdpPPaDXe6B4w6ZQ4wBlarhmg2NB+IC+opwze
	/Ap0b6jQggBqib3IjrICQzN87CkWB2yLHAoGB1Rzke7zMHjmTkAS1D3UVOPfeFSre71Bh2Ze5+B
	lkb
X-Received: by 2002:aa7:d65a:0:b0:6b8:ff64:fc16 with SMTP id
 4fb4d7f45d1cf-6b8ff64fe10mr1611544a12.42.1795069959291; Wed, 18 Nov 2026
 22:32:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAKSQd8X1AJ-rjkj82258Ofk_T3NLspyFzDtbyO4T8W80KzS0Bw@mail.gmail.com>
In-Reply-To: <CAKSQd8X1AJ-rjkj82258Ofk_T3NLspyFzDtbyO4T8W80KzS0Bw@mail.gmail.com>
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Wed, 18 Nov 2026 22:32:27 -0800
X-Gm-Features: AclHuK8tAY2tTGs5KA1smMzBpkg5DSmUWI66T4DGO5Gn28Atamz7HBkIE1ozOmI
Message-ID: <CAKSQd8W1XCHBmtjDRrnipDPM-swngTfuwPmK52S5hch7iVXb7A@mail.gmail.com>
Subject: Re: x86 VERW clarification required from AMD
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 5:36=E2=80=AFPM Christian Ludloff <ludloff@gmail.co=
m> wrote:
>
> With AMD SB-7029 refreshed by AMD SB-7073
> and with AMD SB-3055 out as well, the updated
> AMD TSA doc [1] continues to state that...
>
>   "Execution of VERW at non-CPL0 will not clear
>   the relevant microarchitectural data structures."
>
> Intel doesn't seem to document such a limitation
> for VERW. Can AMD please spell out how CPL3
> code can transition between trusted vs untrusted
> without a roundtrip through the OS or HV?

Does anyone have a solution for AMD CPUs this?

--
C.

> Also, if VERW is CPL-dependent, then so should
> its CPUID flag, ext.21h.EAX[5], be... right?
>
> Thanks in advance for the required clarifications!
>
> [1] https://www.amd.com/content/dam/amd/en/documents/resources/bulletin/t=
echnical-guidance-for-mitigating-transient-scheduler-attacks.pdf
>
> PS: That doc tries to portray 3055 as theoretical,
> which it is not. Please get patched... asap.
>
> --
> C.
