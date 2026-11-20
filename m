Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190309;
	b=f3U0N5AQNTUZzVrq7aOX6imKoeYbAky1PVqdzcaDxYLweLF600qUmrRg04BZRZH6cvnM
	 vMT8XnI4SQPkm8yCPbiVSh6DpkcUGLlpNFlCLzCIFJkin6qfmQt5KCHzZOH8fTrZ5RYlX
	 fjkQ2duiyyHqdr7cY3LTwMR8xRQupoFq65Lm7d9JVPQd4YoKp3gIyJ+u0XNsZ7A+qTqgD
	 obaELfGaCgIsMrRW7XbG1+oO6+n0RLA0wlyi78xpc1uIWi5eJfWResXdXpZc5jfSx030P
	 VgVVffmanVoFRcRm0izfv94b2jsxgTLPuqsgADyOtKkBiw7F7U69NQk567RUxXnM15w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190309;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UGn2Xr8Ly1HQXZSbSFJcSWI6kH+PUQItBE9t+lSvk3A=;
	b=OXIlYrksmOSH4zV9GWmdnUz37jOzmt/zTrcM0agXzTlAOqYZ256ujYxd+ap38IoTlQ6h
	 NLlpDmj7hGHoaa0wlI28FJ4/8OFKuF3NNCZpw9jT20o1sUPoqS39wNrncTtzQzYh34T2O
	 zvwjiK6hvSzMofrhsrQGwLGY/wqRa8dRPS9J1XeHnPBE4ZGCAUM8PlShhIaCnUXwPZ40S
	 fgZIqF0bnGZCTmtZ+uGYsRorfodD2JZNC1+ZbF7kQXIyjMoHi/WcsRob13NwYf82dJ3oq
	 DbUo7Qmhbz+9g+WQ0UZ3Fm73WlAtxLcOHWWpJj0Km8x1CdeS4hZa2F9FiWnxbP9bK8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cZKs2toD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A131C606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cZKs2toD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0457D1F000F2
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795190309;
	bh=UGn2Xr8Ly1HQXZSbSFJcSWI6kH+PUQItBE9t+lSvk3A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cZKs2toD1/1OUcG/OPNE6FqHCbeQFMPDMQmFS1L6pO/rOhbBkwxVxEWLtzv2Ot3sY
	 4l42Weji6q2kFfJuYdn7D8O0JgnQw+nIDTWx9+Rae/MGyOmfnwNs9j4QUDR6L/MU0M
	 2V4mA3jT2TACiTybE33y/oZ7170T3ofWrPd/LgIUwiY8nfdKGgUkqr1P/vsYa986f9
	 KTbR1uV9O6TmhMQL8ExkhBKyU7TduaQTVJvQcnLXDqAsTNQ6k7kuz+gMd3LolCkE7/
	 gYz2iuucDHb7Ljj0+uIoOF7zq35/2Gih+8MPgU7cU6Kcauf+2dS+q0f/Yt3UjPkchR
	 4pbyEXzIQNk9A==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ae25c846edso7490051fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:58:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFe0y/RPPtL4apnXGJ7yUTzU4AURC0oY2t5ejf4ZyZvWxT+A7ShkgxEMqoI85q8NLpDKO+mLTBwePEUurY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PRnM40iaevqwS1ODYAoaVKtb1Fb3heJkJQwLNzXsr8bHqDDw6
	r3GR4So/o5XTaUABLEiloCj1VB7/XLC00FwDbc9p+RLdCB+UJ8L1HAzlikeiGpHRl5OLN9LpKlo
	2dU0lfBV480RE2y+fYJomLHcdTm43qJo=
X-Received: by 2002:a05:651c:418c:b0:3a9:7f37:9bbc with SMTP id
 38308e7fff4ca-3ae7f9f3fcfmr9765561fa.11.1795190307450; Fri, 20 Nov 2026
 07:58:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103124336.174919-1-daiyanlong@kylinos.cn> <20261103124336.174919-2-daiyanlong@kylinos.cn>
In-Reply-To: <20261103124336.174919-2-daiyanlong@kylinos.cn>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 16:58:13 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iV4Le4PXLrCC13rzqFM_2=NRyZTwgu1wBZC58Q5G7ANA@mail.gmail.com>
X-Gm-Features: Aa3M54qjT76rAPYzpTB3L78PLC6FJZuEgSB2yRHdvTEKaUyPsh29mykNrakzloY
Message-ID: <CAJZ5v0iV4Le4PXLrCC13rzqFM_2=NRyZTwgu1wBZC58Q5G7ANA@mail.gmail.com>
Subject: Re: [PATCH 2/2] tools/thermal/thermometer: Fix missing NULL check
 after realloc()
To: YanLong Dai <daiyanlong@kylinos.cn>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 1:43=E2=80=AFPM YanLong Dai <daiyanlong@kylinos.cn> =
wrote:
>
> In configuration_init(), the return value of realloc() is assigned
> directly to config->tz_regex without checking for NULL. If realloc()
> fails, the original pointer is lost (memory leak) and subsequent
> dereference causes a NULL pointer crash.
>
> Fix by using a temporary variable to receive the realloc() result and
> checking for NULL before assigning to config->tz_regex.
>
> Fixes: 110acbc6a451 ("tools/thermal: Add a temperature capture tool")
> Signed-off-by: YanLong Dai <daiyanlong@kylinos.cn>
> ---
>  tools/thermal/thermometer/thermometer.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/tools/thermal/thermometer/thermometer.c b/tools/thermal/ther=
mometer/thermometer.c
> index b4f26d49e4c7..cc84540f467a 100644
> --- a/tools/thermal/thermometer/thermometer.c
> +++ b/tools/thermal/thermometer/thermometer.c
> @@ -142,6 +142,7 @@ static int configuration_init(const char *path, struc=
t configuration *config)
>         INFO("Found %d thermal zone(s) regular expression\n", length);
>
>         for (i =3D 0; i < length; i++) {
> +               struct tz_regex *tmp;
>
>                 config_setting_t *node;
>                 const char *name;
> @@ -163,8 +164,13 @@ static int configuration_init(const char *path, stru=
ct configuration *config)
>                         return -1;
>                 }
>
> -               config->tz_regex =3D realloc(config->tz_regex, sizeof(*co=
nfig->tz_regex) *
> -                                       (config->nr_tz_regex + 1));
> +               tmp =3D realloc(config->tz_regex, sizeof(*config->tz_rege=
x) *
> +                             (config->nr_tz_regex + 1));
> +               if (!tmp) {
> +                       ERROR("Failed to allocate memory for thermal zone=
 regex\n");
> +                       return -1;
> +               }
> +               config->tz_regex =3D tmp;
>
>                 if (regcomp(&config->tz_regex[config->nr_tz_regex].regex,=
 name,
>                             REG_NOSUB | REG_EXTENDED)) {
> --

Applied as 7.5 material along with the [2/2], thanks!
