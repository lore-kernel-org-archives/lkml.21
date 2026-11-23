Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423873;
	b=3gCnHJyKVzkc8maUXwIpinkOfYKJtMIZGf+ZSBgEc/w03vFZnpKVEq0Y9VgBd6ojefrt
	 5ENTrS41sOe2+hM//IcfzTnAIsGBlyyTXlONvQCtknelt+BQthW4cLkQh9y8jXvEvFRpE
	 WIryanRnemwkMmA3pCHf5696tG1DTqiHHg2xB/6UTYqTyUkhxrfGROsDpe7tjips9dJzB
	 AnRZMYEGW7Twdozl3hv7KjbBbChLQhZLSjVK2/a8+35ZDlLaOdqwF1IGpEoXnigghbPJc
	 SfofIMc6YqgwFR0ujRyz2S0sdUW7R4NvtusR9BtpDhP9mgWdRRekiTyW4oJmTjebTzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423873;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=JlRfmLgWn7AmM+uxcSphSyDAprZQ5oJb7FKHCp6Njgg=;
	b=MLT2B8qVu0i0xQne7DNLVLqIrSnRXFJgdjAq6Klbin2WpQYKVhiAg+YBhOEr9iygTcM9
	 SxSO9WJoUzn96OXCOnY2eG+pQxuLwAbvvDVShxYjRCvKFo6uChxbxAfbbUX1FDFItC484
	 4Yt33I97GScIvWY5lSUO8HD3+PMnioQZvTAHPuDVIDgA7XQ+eqxTodhfOBDfrrgv9QWcK
	 SIPCiOOjk+tiuVIBd9Rt+6yLaODlJk/OlqEt/CEv1L5DlZgjmhlaO5JBVMobj3MrLBCSm
	 9cWW/BkfnlTiCyPd9bl+hjaHAri9ZkBMtMzKw7UXvDL9UbFP9M9cpTeLvtgeOMioUkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vD34N8NN;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F79606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0F79606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vD34N8NN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0BD8B1A179E;
	Mon, 23 Nov 2026 08:51:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D598C5FAEB;
	Mon, 23 Nov 2026 08:51:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7AD4A11E687B3;
	Mon, 23 Nov 2026 09:51:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795423870; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JlRfmLgWn7AmM+uxcSphSyDAprZQ5oJb7FKHCp6Njgg=;
	b=vD34N8NNZOvQpxMi7rPbvVXa+z43STW/QmGGtdHUr4CPfE3JPiJueHz5FWIQAG/QdPcOe0
	N33RVCdLH/HHZXcbei3gvVjJUynxb+AsH2w2eL0xz2qMTfdVxQ5E1cGifmOI7M0zyBRUxA
	w7ilhZuL7XfGGI7O5NpKKB8GW4h4HZ9c82ubO6++68vZInhJv/OQ+NsL6yLH3DY8v8zm7g
	P8p2qjyrh1DjToB3iktc+NnFSewx8fqCisQ3TCRj0tX7TjuLkKOC0voyvODAXE+N4+3QhT
	aClcpgEnrjzkuZpQZNvQ1P8Et1Y628VqL+gjCc+sdH4IEeYIUsE/pL3Eb1K9kQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org,  David Lechner <dlechner@baylibre.com>,  Nuno
 =?utf-8?Q?S=C3=A1?= <nuno.sa@analog.com>,  Andy Shevchenko
 <andy@kernel.org>,
  linux-kernel@vger.kernel.org,  Jonathan Cameron
 <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH] iio: adc: max1027: complete the EOC wait when using an
 external trigger
In-Reply-To: <20261122195249.13ee9686@jic23-hlaptop> (Jonathan Cameron's
	message of "Sun, 22 Nov 2026 19:52:49 +0000")
References: <20261115204551.2783884-1-jic23@kernel.org>
	<874idfn30h.fsf@bootlin.com> <20261122195249.13ee9686@jic23-hlaptop>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 23 Nov 2026 09:51:07 +0100
Message-ID: <87mrr0ue10.fsf@bootlin.com>
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

On 22/11/2026 at 19:52:49 GMT, Jonathan Cameron <jic23@kernel.org> wrote:

> On Tue, 17 Nov 2026 11:52:46 +0100
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
>> Hi Jonathan,
>>=20
>> On 15/11/2026 at 20:45:51 GMT, Jonathan Cameron <jic23@kernel.org> wrote:
>>=20
>> > From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
>> >
>> > When an external trigger is in use, max1027_trigger_handler() starts t=
he
>> > conversion and then waits in max1027_wait_eoc() for the end of convers=
ion
>> > interrupt to complete(&st->complete). However max1027_handler() only
>> > completes it when the buffer is disabled. With the buffer enabled it
>> > instead polls the current trigger, which is the external trigger
>> > that is still being handled, so the poll does nothing,
>> > the wait times out and every sample fails with -ETIMEDOUT.
>> >
>> > Complete the wait when the buffer is enabled but the device's own
>> > trigger is not in use, as the comment above the check already
>> > describes.
>> >
>> > Fixes: 075d3280b4a1 ("iio: adc: max1027: Allow all kind of triggers to=
 be used")
>> > Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
>> >
>> > ---
>> >
>> > The comment clearly states that we should just complete for
>> > triggers other than the one provided by this device, but the
>> > code doesn't do this. Ideal would be if someone has the part and
>> > can test this.=20=20
>>=20
>> I no longer have an easy way to run that code, but looking at it 5 years
>> later, I agree with your description of the problem as well as your
>> solution.
>>=20
>> > LLM spotted the issue whilst doing some other cleanup and
>> > prepared the patch.
>> >
>> > I think the reason this got past testing was that the code was
>> > fixed to actually return an error on timeout whereas a bug
>> > previously meant it always dropped through and carried on.=20=20
>>=20
>> Ah, right, intersting, I guess you talk about
>> 2021ef060900 ("iio: adc: max1027: fix error code in max1027_wait_eoc()")
>>=20
>> > ---
>> >  drivers/iio/adc/max1027.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/iio/adc/max1027.c b/drivers/iio/adc/max1027.c
>> > index d475cc91108d..65a0e85faca9 100644
>> > --- a/drivers/iio/adc/max1027.c
>> > +++ b/drivers/iio/adc/max1027.c
>> > @@ -478,7 +478,7 @@ static irqreturn_t max1027_handler(int irq, void *=
private)
>> >  	 * with another device. The core will then call the relevant handler=
 to
>> >  	 * perform the data processing step.
>> >  	 */
>> > -	if (!iio_buffer_enabled(indio_dev))
>> > +	if (!iio_buffer_enabled(indio_dev) || !iio_trigger_using_own(indio_d=
ev))
>> >  		complete(&st->complete);
>> >  	else
>> >  		iio_trigger_poll(st->trig);=20=20
>>=20
>> In case you want to make it closer to what other drivers do, you may
>> invert the condition to simplify the reading:
>>=20
>> 	if (iio_buffer_enabled(indio_dev) && iio_trigger_using_own(indio_dev))
>>   		iio_trigger_poll(st->trig);
>>   	else
>>   		complete(&st->complete);
> That is indeed more natural so done what you suggest and applied.
> We are fairly late in the cycle so I'm not going to rush this in.
>
> Applied to the testing branch of iio.git, so targeting next merge
> window.

At -rc4? There is still a month before the merge window, for such a
small change located in a driver, I would not bother delaying it :-)

Cheers,
Miqu=C3=A8l
