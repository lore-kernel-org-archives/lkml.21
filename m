Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795553211;
	b=pEYqoXdvlcSHxYTRcmHv5HhSCBxStCfqcU1PXlJ2HufBVZUROxSM452wm9vHcZQJooj8
	 ZYp0bqsNM2lUO50ThvIhTyI40wGVfwqwWaP+ddyiSen9foFR3vh2vb5/O3kcq/UTgpEvZ
	 jJLhO5qo77WEXmuwhtNeYwz18lzhm+NY4K79LmHgA/0hXJrNugMbYwH+rsZ4N7MvMgC9Q
	 1GoiQRbuxy1SNFBdFhR353kbh+X8DQ0Xfo5eLB5kDQdtSTAD4/Q9GmIKMzWTYpX4yk5d2
	 x/zk1U235Op1gDx+sHZUlHZavXsbbgoJv6WE1qpsB3glBnRkorP3TJeqk6BPgXOZulA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zDNVDfs2PwxqSj0Kee0hW9NffVRwrghNSp33hY60Ag0=;
	b=fF2/9n1LUC7MZV57JNO8CGFKdaddKiX6wuwDSHk/E0CnCaEaYSSVGsSX06OH8qwnTJVn
	 IqW0Jj0dC6Z6z+O10nn1NjOiL+D6aCSwdo4sYNFljtxeKiPxxtB9SGl9MmpduDR0JEBXk
	 SuZ8iEkLXP5ngrJXN8xsn8ZK4NVlekUIfw8lptnk382FV8aV8laFWMR3twSZjBLJZ3hqA
	 wpiXx0QaTxx7aUEO4zcHKDFV02dJmf8taNSVKnlOvK+kYAiJxMSUBYwd7gQ1ZwvURJE/H
	 fWKSp7pbFl06VIfop/PueIVyenObj2+Attj9qs8i8hr1fewker2sCEfO8w96EyJigHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=GLPxPbid;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FDE606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6FDE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=GLPxPbid
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b0d126f631so43165377b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:46:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795553210; cv=none;
        d=google.com; s=arc-20260327;
        b=CET4IXOxC/VpTx4hF8dGg5kvLeC19ITlocf7/Uzm3kHAGujkk64dPVhNOmyiZoNHDY
         uEdtdMMD0hersP7sqQei+Kyavjz3D59niOikMJ8mGmBLSoAz5WmLPo09dQKqQbD3HoLj
         QRwBgidvAfN2nKWlRXR/+06vQ0soW9ZNksaw2KbULp6/RyJk3Muio54Boda9pbOIhQ+5
         S/wBWvIXAskhXxllplqdNynj3109gH/HR/dw2fflWRM8EbgUOr2APfnhBsS/T4PGPneQ
         sF7i/t6x9aWaj4epJQ9YsBRDnZTL3VE53wmZ7xLIGLONeox9s1phGW22tyvLrwQ8JssV
         qtEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zDNVDfs2PwxqSj0Kee0hW9NffVRwrghNSp33hY60Ag0=;
        fh=UfdUIOv6Pe7tEKPFGHh1R6qtpVpUsNOJaO2CYtX26Fs=;
        b=p/rAID/B6SeNB9eawmSqP7vyZjNNadcVlzzw8RlkRDefDJcAAQObx0QnLMdDqtcDYA
         SYmyfQ8ytdVlCrp9KF0x3V/NnHYAJ0k7QTisCteMGG+1MbzJkkKeTYl3zv2b9Nc+3YTa
         OkVm/ClmuSVpe75f2XbiA9o9GA5cAPvawumZLM7gdNpAPV4jILmq8yVXkM7dOUSmbsRd
         +QVpMNq881kFktEV9Y/WpWn/7uovQcJBP6pglP0qqRt4DKAMuLy8ZFNAQxQdqvchYgx3
         GysDq/8KPvqA0S6uJefjPCrjQeNmDTcaJcuOvzkFqDT8dY5uADeay7jUX2NRO9Xquq/A
         xB/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795553210; x=1796158010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zDNVDfs2PwxqSj0Kee0hW9NffVRwrghNSp33hY60Ag0=;
        b=GLPxPbidss3ZjxqoA6dUrBKQsf6QpS4A2gR1m9gojSDw7SVtAKuSRUwYNvCRMEs+jG
         nBN0jqNDCwGYL7QqFGSylE2ayToGE1ORhbUOCm6a8i1C3iIJX8KgTq9pJiskUczU333B
         BU6N40yrS5xt1XSBSBbQLP2l/3m8StLo9HWeN3gqCubW3UnRJk+hNKuOFM0GlakhrQtd
         BD4j7uB1FL2ShtAp4PRnUXM6qL6yU0gIvZi/maIVBzDAymOKR2yU1xEIuuyt+1JS8alU
         nZkm2owPG/I9tRpSND59PntDJO2DqiQtU6o2hnlg6zV5MsaKXB9z3kBxjkJnTz4MdlJU
         r4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553210; x=1796158010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDNVDfs2PwxqSj0Kee0hW9NffVRwrghNSp33hY60Ag0=;
        b=sEdzAYh6IG35RfAmNblLTdup2w8WtoX/kYKceMp1lBZR4AKHBg+/lu6n7k4+5J6RTl
         F6vyvPeNJm8r659jmnhFT8eq0ZEnZnyQtoYO9WcRD3NqeUKqME7vXucwUkUpl+8biDhV
         xlc3+WVLihMmjkVsq5d0rarefxHZj98I3CPzOWTnUp56aTGtQf4f/7/aDZyVQNN1WfST
         7Ar8NUmWpG/8iAfMZm9tu6UxXwWSdsm0cqqT6O1I1YcdTH3C4WDpyaRS8bquyvgp+FPv
         0BxTqVGRGFooYYFFSLWxAYjITUFpRRgaX9w0U0wf2EVnhzJ74ffVTssP7Z+Daswverxq
         tPvA==
X-Forwarded-Encrypted: i=1; AL+hErFlnbMoBiVuS1CV3gkVoJm/LHyFX9Oz3g55y9vhWolG6MUFi8FUiLBtKc8mZyx0bO79AUIfnST0pAvUqlk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tQXrrSLjZkMXTH/ZivZy15TRpPekB4p1pXlLxKUzeLxCU3N7w
	2r4n64zl56K6YYv9nLxE264yHUylGPBvv8qvJk8gUDKhUA4w/F2d4yG5oX9IJP4g7ihIZoM8lix
	Y/ZqHysrXHluFJmKN7Pz3Dczt/PE32qE=
X-Gm-Gg: AZFdTZdTe8iB26KNj35ZePI7ivaZGkq11UPaRpuyo1+P70nqAxLn95Ldf9V8BPfUvQF
	vniZjOQhhL1qh/nuBcQ8hT8mRGNq5WFqfB755dC3RU3LGxk9Ujw8Gq6p4MTV3X+Fnc/niPElSW9
	DnGyk/GtBdwGRf5OzXpdrimlOXt8bKa0nSb09MSyKR2UwvbwVRPU7ycSIHEOHqR1dVt9nt3B0Y+
	lHjAI868OIuAf+pC7OJwBZt7FOGYwsduDjn5Hv+Y1SIxeqChOU1QwaB7yxGj9GcSvdtbI5mbfD5
	lbbISx0eW4yHDzWqYgAtfm8t35FVtvm5g5C/y/dTRhCnxZU9IoaZYCuUgeXPAdJ/3NJENFsZtwZ
	WZkdMmkAaj4Xsw98mP4i3bMjHEEIQMGCTxhUlH5CL+8oVeGYUpdFF2t9IqcKeb3F18WHVYQ==
X-Received: by 2002:a05:690c:4a02:b0:8b4:c1ef:7a62 with SMTP id
 00721157ae682-8b5204e0b7cmr63699017b3.49.1795553209755; Tue, 24 Nov 2026
 12:46:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-4-tanure@linux.com>
In-Reply-To: <20261121213102.143130-4-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 21:46:39 +0100
X-Gm-Features: Aa3M54p-q6D_8aoLALfJ3nd02LBvNVydTGTGPe-SwdQ6NHwkSXTzPSzZ9Fj7tMI
Message-ID: <CAFBinCAB+CdP7ypZ3kZKKqFTqoAA5bdA9nUKkWX3fVit5LBNGw@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 10:31=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
>
> The SoC has a Synopsys gigabit MAC, glue registers for the interface
> type and clock timing, and a multiplexer that points the management bus
> at the on-chip 100M PHY or the external pins. None of it was described.
>
> The controller reaches memory through a pipeline stage with a gate
> nothing else claims, so it is switched off as unused. The
> glue registers share a clock with the multiplexer, which probes after
> the controller has programmed them: unless the controller holds that
> clock, the writes are lost and the port keeps the
> bootloader's delays.
>
> The multiplexer and the on-chip PHY bus start disabled: a board enables
> the multiplexer with the controller, and the on-chip bus only when it
> uses that PHY.
>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Also I checked sashiko's comments: those seem to show up because it
didn't see the patches in net-next (not sure if/how it should know)
