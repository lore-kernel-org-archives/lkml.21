Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100853;
	b=h/PX99Rq7SPgjXw0bSTzupi6Pfd8nlDEqqX5TJWrT7R0ReQ1tgKCOIMLKlFpf5d4HOny
	 3iz+vNPuD39rrlopzMBULBw6m54ezIFhpfrokGtBVPnYO6PBid+/ksQqLS2bXrzkLt0HC
	 28B5lIvlAGiwSCOLrsTv4m6IbRZRH2rc/xS8W5SVoodfsAlnqbf7ybD1BrlSjznkcJcEU
	 lbQP8nhunosRsSzZg9BI6JGhVB14xgSkZMFPmBqo7jitil75WYKscY3Cf+6wdiSGMZzAS
	 OjdQOplEy4gPfZ14MF4YD3DF/Any/9JOaNQDF1ht+fiaRpU8ARJuKb/TzmWJyr0f2Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100853;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=NMbJXpa8Ff5B9n0Xebju/UKReFbt+Ck0BYWkUwovowc=;
	b=OpVnYVN8SyCIHt0/9zjttZVf7oGcVxhIu8K7pK+KUBLyZV2VO1ECllsjPLqU1Hsq11L7
	 e9U1niZIcvtyjToLBlzBAD7Rme4Fndfl+2IqoyQMj1MioxA++ySEu2derukQzomOyBhWp
	 g0yKryiVdgYQZZF9JyR+Iz1ZjCAoeQXJz48rS/Xi068EkVeLP4YVGotcVrguuA7/BG2oe
	 /N1yb5gWAho32YOn2k8Y7zq82pOJmffy8BQESqqemGfwhdWYy1/ZAR4pDHJ+sXH31CLpC
	 LARJuaKzw3LlnhqnY9c5AfD5abhiaBK8RdR7jo+M237t1N0vz0KSNDd8IKIYkPzWknw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UQ9uyv4r;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pi8bpAws;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AF1606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3AF1606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UQ9uyv4r;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pi8bpAws
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795100852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NMbJXpa8Ff5B9n0Xebju/UKReFbt+Ck0BYWkUwovowc=;
	b=UQ9uyv4r+EIM9RG7Im8LMRCI1oihFDpWiBfSwDcEkRPXPbf7a/ndNImb7hk/Ap4qSR0GRU
	udfUlC9qio+tTDQKTmKk3o6wrQh5I+BgZDj8qty+1e8sm9Oyq5bzgh9iYveMbXZyUUi4OU
	jXVyjRCt0VfkTpHhJDy3EckGaW9ZZAU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-EkLouDYkOOeAVgTMCA-dPw-1; Thu, 19 Nov 2026 10:07:29 -0500
X-MC-Unique: EkLouDYkOOeAVgTMCA-dPw-1
X-Mimecast-MFC-AGG-ID: EkLouDYkOOeAVgTMCA-dPw_1795100848
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-492b5408dedso1504215f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795100848; x=1795705648; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NMbJXpa8Ff5B9n0Xebju/UKReFbt+Ck0BYWkUwovowc=;
        b=pi8bpAwsy8RljnM+kRmJ/JJkZ8i5WR6dpZ96YCe8S39bFUoFsX9xNJcmwOe4pK4tWb
         Yy1D3TNmnWOPpkzqa4SFNrcVrzjsiJp4ghDDAQ6h2TtnKp0qE8x+ba8EIlULqk/QfkYS
         /eZgdsIzF27BFZDeDbCA4twMOGKf40Eqs6iIuYuzF00wxoopjL8diUUwnlxKRADwsKRA
         4Pr5pD3sV95VSMDEuh6X6Cfi89wq/TgeKbowb9w0TUIr+wURRLpy2GYAUGeDuD1xoOQI
         0RcBzlc0r+mch23ANZu+fEm20y0mNv1Hl0YZXkHz3YBbTU/ZHyZrKXUNTJHQRkYm5qM7
         /0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100848; x=1795705648;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NMbJXpa8Ff5B9n0Xebju/UKReFbt+Ck0BYWkUwovowc=;
        b=0ZUmjXK/njUKUHTaQp7gg/PSncjPXWKLvo1Av3iDCFRqjCzcz9tJi8o2u+cIvj+gsi
         tCcw1hAhNBhwy1J1FNX0Ey7BdDQU7lm2Lgtqo0YYU/evV6Wp6Zl6ZIr06IkaaqdfMUqg
         SVcwQwUdlTgmE+XnlXBCkQv192hyVg5598g0sSWML1LSOmLjKzjbxXj1JbHoZt2pXz36
         YJp3bfyerucs3ncYmQQUxzvyPhbIpvGpmjV/VCPk8SPXPzobGncr+wCOlLs9xRBcGAI8
         wRgmTCIQRQkAdlTOcn9NxavgviWQJlkXGRql0CAbx+HrywW1Q/3tYEqRXTghAPkNIJcG
         KS/w==
X-Forwarded-Encrypted: i=1; AL+hErHU6ViJafMUMSKDeQRumKP14w+5vrIuPTqtI1mkVo+/ZrKRLjGJbbe0KEkf52FMsMc8pQW2WAM0pi482mE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kpkS4kCeYsAtEEkfbV/WHsOjbQO/kM9PaA9P8tGtb96ktmMiM
	r8YEcpayfvWdBrIk+D1D0JfXmW8WxVCqmt2d6sywSntDIEoGIjHz2qDZ7Nz5WKkcSSW28j3H3wk
	AHPXXzRl2TRZaCclUGeP6E1IjBanh4WUfRVx001zwQc/baROZ1oLUKLch0qzK0D0qfXMe80mBSy
	VwURs=
X-Gm-Gg: AZFdTZeNRYc/E2EWMtd/MmFrG7rTpM9zi+qdipjpWu0R7T/7zuOiob/LsQBN/F4UbMV
	yfB9Z8KoMjbHqv31H9cEz/g0MnfpMi+AsIpetilphxqAWroOl8LByYsQcUHb/lO/bm96arYF68X
	PEeKtn/8VdMDjQ65mjdkTmmXsBhQM4O4OjbLnTQEJvAtIOMGvJyY/DG6C3ffO5vghcaB0t7BHSS
	8cGMtu6A0U07EV/a/JXN6id5cy3OkMRnJ5qiol108jtBDcJbJB8yP/e2HTYkFr+Ubhdms7rERzp
	6koHvirEOc7C8gZLTXs/EQitape9pg/n0y7snGH78wJLLh7+AO2GG/pqKb6XKKLuHcGBbEAp+T7
	qLq5WomyOmGkoO7xH/ncAsFTvBsOBdSGws8JXFzSJS3fSuRbVVqBGfLrnIU6lNA8YdQIa5r/50z
	d4
X-Received: by 2002:a5d:59c4:0:b0:4aa:5396:a7bc with SMTP id ffacd0b85a97d-4aa5396aa18mr3774246f8f.40.1795100848294;
        Thu, 19 Nov 2026 07:07:28 -0800 (PST)
X-Received: by 2002:a5d:59c4:0:b0:4aa:5396:a7bc with SMTP id ffacd0b85a97d-4aa5396aa18mr3774181f8f.40.1795100847854;
        Thu, 19 Nov 2026 07:07:27 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm72072f8f.42.2026.11.19.07.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:07:27 -0800 (PST)
Message-ID: <9e5ef6b35fe5788ddb425a3e64bb55c64dfb5ab1.camel@redhat.com>
Subject: Re: [PATCH v8 03/14] rv: Add a KUnit test for the HA timer underflow
From: Gabriele Monaco <gmonaco@redhat.com>
To: wen.yang@linux.dev
Cc: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 16:07:26 +0100
In-Reply-To: <4ae656adc2e23939c3bf2138e1d6a9ee496fe4da.1793900349.git.wen.yang@linux.dev>
References: <cover.1793900349.git.wen.yang@linux.dev>
	 <4ae656adc2e23939c3bf2138e1d6a9ee496fe4da.1793900349.git.wen.yang@linux.dev>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-06 at 01:49 +0800, wen.yang@linux.dev wrote:
> From: Wen Yang <wen.yang@linux.dev>
>=20
> Add rv_ha_kunit.c as a standalone test suite with rvtest, a minimal
> per-object HA monitor, to test both underflows fixed by the previous
> patch: an invariant checked while the uptime is below the budget holds,
> and a timer armed after the budget elapsed expires now. Without that fix
> both expectations fail.
>=20
> Building the HA test in its own compilation unit keeps ha_monitor.h
> isolated from non-monitor test runners and avoids macro conflicts. The
> suite is guarded by IS_ENABLED(CONFIG_RV_HA_MONITOR) so kernels without
> HA monitors build cleanly.
>=20
> Suggested-by: Gabriele Monaco <gmonaco@redhat.com>
> Signed-off-by: Wen Yang <wen.yang@linux.dev>
> ---
> =C2=A0kernel/trace/rv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0kernel/trace/rv/rv_ha_kunit.c | 152 +++++++++++++++++++++++++++++++=
+++
> =C2=A02 files changed, 153 insertions(+)
> =C2=A0create mode 100644 kernel/trace/rv/rv_ha_kunit.c
>=20
> diff --git a/kernel/trace/rv/Makefile b/kernel/trace/rv/Makefile
> index cdbf68c84f5a..4b84b83b942b 100644
> --- a/kernel/trace/rv/Makefile
> +++ b/kernel/trace/rv/Makefile
> @@ -26,3 +26,4 @@ obj-$(CONFIG_RV_REACTORS) +=3D rv_reactors.o
> =C2=A0obj-$(CONFIG_RV_REACT_PRINTK) +=3D reactor_printk.o
> =C2=A0obj-$(CONFIG_RV_REACT_PANIC) +=3D reactor_panic.o
> =C2=A0obj-$(CONFIG_RV_MONITORS_KUNIT_TEST) +=3D rv_monitors_test.o
> +obj-$(CONFIG_RV_MONITORS_KUNIT_TEST) +=3D rv_ha_kunit.o

I think it's alright to reuse CONFIG_RV_MONITORS_KUNIT_TEST, but you aren't
doing it right in here.
CONFIG_RV_MONITORS_KUNIT_TEST depends (now) on RV_REACTORS, rv_ha_kunit doe=
s not
however. Also using IS_ENABLED(CONFIG_RV_HA_MONITOR) generates an empty mod=
ule.

I would either change the "depends on RV_REACTORS" in
CONFIG_RV_MONITORS_KUNIT_TEST to "depends on RV_REACTORS || RV_HA_MONITOR" =
and build
conditionally the two modules based on their requirements only (in Makefile=
):

ifdef CONFIG_RV_REACTORS
obj-$(CONFIG_RV_MONITORS_KUNIT_TEST) +=3D rv_monitors_test.o
endif
ifdef CONFIG_RV_HA_MONITOR
obj-$(CONFIG_RV_MONITORS_KUNIT_TEST) +=3D rv_ha_kunit.o
endif

Or just create a new CONFIG_ symbol.
I didn't test either, but in any case you shouldn't prevent compilation
of an entire C file from the C file itself, use Makefiles for that.

> diff --git a/kernel/trace/rv/rv_ha_kunit.c b/kernel/trace/rv/rv_ha_kunit.=
c
> new file mode 100644
> index 000000000000..e8aaee110fae
> --- /dev/null
> +++ b/kernel/trace/rv/rv_ha_kunit.c
> @@ -0,0 +1,152 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KUnit tests for RV hybrid automata (HA) framework
> + */
> +#include <kunit/test.h>
> +#include <linux/rv.h>
> +
> +#if IS_ENABLED(CONFIG_RV_HA_MONITOR)
> +
> +#include <rv_trace.h>
> +
> +/* rvtest: a minimal per-object HA monitor driven directly by the tests.=
 */
> +#define MONITOR_NAME rvtest
> +#define RV_MON_TYPE RV_MON_PER_OBJ
> +#define HA_TIMER_TYPE HA_TIMER_HRTIMER
> +typedef void *monitor_target;
> +
> +#define rv_monitoring_on()=09=09true
> +#define trace_rv_retries_error(...)=09do { } while (0)
> +#define trace_event_rvtest(...)=09=09do { } while (0)
> +#define trace_error_rvtest(...)=09=09do { } while (0)
> +#define trace_error_env_rvtest(...)=09do { } while (0)
> +
> +enum states_rvtest {
> +=09idle_rvtest,
> +=09armed_rvtest,
> +=09state_max_rvtest,
> +};
> +
> +#define INVALID_STATE state_max_rvtest
> +
> +enum events_rvtest {
> +=09start_rvtest,
> +=09event_max_rvtest,
> +};
> +
> +enum envs_rvtest {
> +=09clk_rvtest,
> +=09env_max_rvtest,
> +=09env_max_stored_rvtest =3D env_max_rvtest,
> +};
> +
> +#define HA_CLK_NS
> +
> +struct automaton_rvtest {
> +=09char *state_names[state_max_rvtest];
> +=09char *event_names[event_max_rvtest];
> +=09char *env_names[env_max_rvtest];
> +=09unsigned char function[state_max_rvtest][event_max_rvtest];
> +=09unsigned char initial_state;
> +=09bool final_states[state_max_rvtest];
> +};
> +
> +static const struct automaton_rvtest automaton_rvtest =3D {
> +=09.state_names =3D { "idle", "armed" },
> +=09.event_names =3D { "start" },
> +=09.env_names =3D { "clk" },
> +=09.function =3D {
> +=09=09{ armed_rvtest },=09/* idle */
> +=09=09{ INVALID_STATE },=09/* armed */
> +=09},
> +=09.initial_state =3D idle_rvtest,
> +=09.final_states =3D { 1, 0 },
> +};
> +
> +#include <rv/ha_monitor.h>
> +
> +#define RVTEST_BUDGET_NS (300ULL * NSEC_PER_MSEC)
> +
> +static u64 ha_get_env(struct ha_monitor *ha_mon, enum envs_rvtest env,
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 time_ns)
> +{
> +=09return ha_get_clk_ns(ha_mon, env, time_ns);
> +}
> +
> +static void ha_reset_env(struct ha_monitor *ha_mon, enum envs_rvtest env=
,
> +=09=09=09 u64 time_ns)
> +{
> +=09ha_reset_clk_ns(ha_mon, env, time_ns);
> +}
> +
> +static bool ha_verify_constraint(struct ha_monitor *ha_mon,
> +=09=09=09=09 enum states curr_state, enum events event,
> +=09=09=09=09 enum states next_state, u64 time_ns)
> +{
> +=09return true;
> +}
> +
> +static const struct rv_kunit_mon rvtest_mon __maybe_unused =3D
> RV_MON_OPS_INIT();
> +
> +/*
> + * rv_test_rvtest_underflow - the HA clock math must not underflow as u6=
4
> + *
> + * An invariant checked while the uptime is below the budget holds, and =
a
> + * timer armed after the budget elapsed expires now.
> + */
> +static void rv_test_rvtest_underflow(struct kunit *test)
> +{
> +=09struct ha_monitor *ha_mon;
> +=09struct da_monitor *da_mon;
> +=09const int id =3D 4242;
> +

A failed ASSERT quits the test and doesn't run any cleanup, either use a mo=
nitor
type that doesn't require cleanup or arm the cleanup here da_monitor_destro=
y()
and enabled =3D 0 should be enough).
The way we arm teardown_test() in rv_monitors_test.c should do.

> +=09da_monitor_init();
> +=09rv_this.enabled =3D 1;
> +
> +=09da_handle_start_run_event(id, NULL, start_rvtest);
> +
> +=09scoped_guard(rcu)
> +=09=09da_mon =3D da_get_monitor(id, NULL);
> +=09KUNIT_ASSERT_NOT_NULL(test, da_mon);
> +=09ha_mon =3D to_ha_monitor(da_mon);
> +
> +=09/* Uptime below the budget: time_ns - expire_ns would underflow. */

This comment isn't quite meaningful as again it describe how the code was /=
once/
broken.
Be assertive like "Expect no underflow even if uptime is below budget (0)"

> +=09ha_reset_clk_ns(ha_mon, clk_rvtest, 0);
> +=09KUNIT_EXPECT_TRUE(test, ha_check_invariant_ns(ha_mon, clk_rvtest, 0,
> +=09=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RVTEST_BUDGET_NS));
> +
> +=09/*
> +=09 * Budget already elapsed: expire - passed would underflow and queue
> +=09 * the timer at KTIME_SEC_MAX. Reset first so the expiry does not
> +=09 * report.
> +=09 */

So here what you're trying to simulate is:
* reset with now =3D 0
* start the timer when now =3D BUDGET + 1s
* validate the expires didn't overflow (timer expires in past)

The NSEC_PER_SEC is just a magic number to avoid off-by-ones right?
In both cases we aren't really waiting for 1s, but maybe just use
1ns (+ 1) to avoid confusion. Wouldn't that work?

The comment looks a bit misleading to me.
Again I would say something like "Expect no underflow if timer is
armed when already elapsed".
I wonder if the reset (timer cancel) is really required here.

> +=09da_monitor_reset(&ha_mon->da_mon);
> +=09ha_reset_clk_ns(ha_mon, clk_rvtest, 0);
> +=09ha_start_timer_ns(ha_mon, clk_rvtest, RVTEST_BUDGET_NS,
> +=09=09=09=C2=A0 RVTEST_BUDGET_NS + NSEC_PER_SEC);
> +=09KUNIT_EXPECT_TRUE(test,
> +=09=09=09=C2=A0 ktime_before(hrtimer_get_expires(&ha_mon->hrtimer),
> +=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ktime_get() + NSEC_PER_=
SEC));
> +

> +=09ha_cancel_timer_sync(ha_mon);
> +=09da_destroy_storage(id);
> +=09da_monitor_destroy();
> +=09rv_this.enabled =3D 0;

This is the part I would /only/ put in a teardown helper triggered by
KUnit, and only the last 2 statements, the others are implied in the
destroy() aren't they?

Thanks,
Gabriele

> +}
> +
> +static struct kunit_case rv_ha_kunit_cases[] =3D {
> +=09KUNIT_CASE(rv_test_rvtest_underflow),
> +=09{}
> +};
> +
> +static struct kunit_suite rv_ha_kunit_suite =3D {
> +=09.name =3D "rv_ha",
> +=09.test_cases =3D rv_ha_kunit_cases,
> +};
> +
> +kunit_test_suite(rv_ha_kunit_suite);
> +
> +#endif /* CONFIG_RV_HA_MONITOR */
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("KUnit tests for RV hybrid automata (HA) framework");

