Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022169;
	b=DRTokOEl00PzkJAw7jygL5+o0pPGrErxtO9C/ziYfbqpgPjH5cm+FA9EQ9GWF/UEokl8
	 /gUquZHKCe1fSgxg+RXPL9P3O/L5Az58dGdTh3QsEWUe59Irbnjcz/DYcp9hqgdvNimdH
	 ZNMKfR0NoB/XbLFlY42D5SephUCbLC0y6q5pKjHUmF+iMFz3AOsb8lttNiAk9lNZ7ooEA
	 r6Gy81+hrjZT0lBXVrivg3dSgAqqP7ANB7rJhOQuuPjCYHFmuB7fdfuXQuXDI9qmyDbvE
	 GFmzutSeYXVSKy28XXBbl1+Zwo5w5vG6XC1CNjcf9ms8MDYknEWr/6sBCd59lXm5svA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022169;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=azMjNdYADYprUFTQqXnXRt+Qw7yDyykdEbBxtGqlwkg=;
	b=d7UKgBBMQO7KJR8L+3VPvx89cOJKosiujPWvRIWlQMpgAl5DNbiz0TZPF72RP6PIVLTU
	 8qelBUJqNp3x1nkIgmndF8fk+wvH+5EwvmSqnybP+2GoUAAQvJqAaXGiJ2oHp3lmwtVoU
	 Yya4Q+H8SaS0nZWMhHZm4oK7nx7j734aV1J/Nk9klN41cYIFEL48huMh7DG2i3BEWnh/q
	 0TEB04swQkVvwVhWBR+eTHRtgm77A7SVp8HBYFFY1Nl9COlNAkOWPKtrYSFdoTftiLgTs
	 K1KzwsL3mYcoMdJqWYvftw5NR/y+WQys6SsDCFPHj7MgvJSbhpTR8LPk6524bEmNAYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ubvuxvkU;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70F8606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C70F8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ubvuxvkU
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 597A24E40B00;
	Wed, 18 Nov 2026 17:16:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 231C45FE9B;
	Wed, 18 Nov 2026 17:16:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FFA211BC2A6E;
	Wed, 18 Nov 2026 18:15:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795022162; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=azMjNdYADYprUFTQqXnXRt+Qw7yDyykdEbBxtGqlwkg=;
	b=ubvuxvkUmYhT7rBjFh7+hL3MGn/EZTSrIeC279f/6wUx9rBSNHIkKD93l+HtgnF9zbyz+y
	h6gOmUC7+Cng+BsfY5/UUGXD7EgAVR8ZqQQAloAd08tRmnrDbKC/M1k/IT8K1kR2OOYH2P
	LcBDhHqO+iX8XxgIBsRhlMg/vSQ1WTp9JtnZIFJy/tfCTx9S10g/gqVNytFIzTbWAL4Ej6
	qn6coN94CLK3MSHKKGXt8gol9lLe0ITQAUFMmHo65hANA5yssndwfrVd0tSvXGwKr+GLPa
	u/P8XV6IyRzU+W+/U54Aps6qyZdJYVH70tD6TM077S2B6yGLztzsJ4S+ENvjWA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Boris Brezillon <bbrezillon@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: propagate timing-mode recovery failures
In-Reply-To: <CADvTj4or-XBJCp3oUh2T438Tf5kB0vfecNzOV+haisVrLKW9vA@mail.gmail.com>
	(James Hilliard's message of "Wed, 18 Nov 2026 09:49:52 -0700")
References: <20261103-submit-rawnand-timing-recovery-v1-v1-1-1cc33723e052@gmail.com>
	<874idejux6.fsf@bootlin.com>
	<CADvTj4or-XBJCp3oUh2T438Tf5kB0vfecNzOV+haisVrLKW9vA@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 18:15:58 +0100
Message-ID: <871p8igiwh.fsf@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

On 18/11/2026 at 09:49:52 -07, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> On Wed, Nov 18, 2026 at 3:28=E2=80=AFAM Miquel Raynal <miquel.raynal@boot=
lin.com> wrote:
>>
>> On 03/11/2026 at 23:13:18 -07, James Hilliard <james.hilliard1@gmail.com=
> wrote:
>>
>> > When GET_FEATURES succeeds but the chip does not acknowledge the reque=
sted
>> > timing mode, nand_setup_interface() falls back to mode 0. Both the
>> > controller-interface reset and the NAND RESET command can fail, but th=
eir
>> > return values are discarded. The function then returns the successful
>> > GET_FEATURES status even though the fallback did not complete.
>> >
>> > Check the controller reset before issuing RESET and propagate either
>> > recovery error when there was no earlier error. Preserve an earlier
>> > GET_FEATURES failure and keep returning success when a timing mismatch
>> > is recovered by a successful mode-0 fallback.
>>
>> You are carrying a return value in an error path of an error path. If
>> the reset actually fails, the very next attempt will fail and probe will
>> be aborted anyway. So while the fix is not inherently wrong, the title
>> and commit log overstate the problem.
>>
>> My proposal:
>>
>> mtd: rawnand: propagate mode-0 fallback failures
>>
>> When a chip does not acknowledge the requested timing mode,
>> nand_setup_interface() falls back to mode 0 by resetting the controller
>> interface and issuing a NAND RESET. Either step can fail; returning
>> success will likely lead to any later attempt at talking to the chip to
>> fail.
>>
>> Make sure the error path propagates those failures in the mode-0
>> fallback case.
>
> There is also a caller outside probe: nand_do_write_oob() calls
> nand_reset(), which calls nand_setup_interface(). If GET_FEATURES
> reports a different timing mode and the fallback fails, nand_reset()
> currently returns success and the OOB write continues past its reset
> check. Propagating the fallback error lets the write stop there.

If you are at using nand_do_write_oob() there is no reason you would end
up in the error path of the setup interface step. This reset is super
legacy anyway, the comment says August 1999. This path is also not so
useful anymore. You can mention it at the end of the commit log though.
