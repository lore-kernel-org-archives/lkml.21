Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999763;
	b=McsLd6AtYu7bxasxk9Zag8kI/KQMz8Iuk/QGIulbXKxKOJFPReXvLB2gi6+xPM3h5dTM
	 QLEk/1pXIP6hhO8YsUrd11g7iFWATtPIxf8lvP/l6VKBKN5z6f+XDwxKXI9hRN3Fi+vrZ
	 DZH9E9gfkojQzCupYEVfRu7mwWgqw8eP65SZpLNDKpGBH8iX2OWNRHTBsMd/FilzjvnyY
	 s5AEt7V4p4yYAqRx/Jmc2Bg4UGyZl77NuNPH1/itu5Rz9hva1TCB6giOPcUjU8HHf2o8P
	 7SVhLUIxNEsuNEOgU8qQW9K5TxXLLqE3NyopiJf7yQc/aLGuIGYKpB/4TULhETwa9gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=byVP+MQq7ChvGBwilcmaxcWIWInzE1cO9w8bw3Vvmhk=;
	b=EOzf1SuGeGy48A+OSCaIpvImYaM0tFmTp+V8BsD5d/HnsxqRvdQ8RQRB/kOcsxXbDJuy
	 WpbJAhUnoZuIqtVj71g07f2tzlkrUB5KLk4ycZJJHgCqmkNPt3xy5iDOlk0lYHBv3s8/R
	 66EY7Ptir/jg8r8wON4nxShF2yy+/dvZ4XfshQeELrfqRF0pQIRiLwaplRY/vA9rMJ1lC
	 pl6ECv3FkIVaKQq7xif5VBFgozUT+I9uleb49gAaiF9FA/3Stip72wTgB+KBVk47dU/lq
	 6/dmPKSoZxKokJmbG0/Yv+8IhMruk90+fKsqvFNstpXkgvsx7WF31wwIvWP6VDFyb6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QEtz2yHm;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D30606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9D30606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QEtz2yHm
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso981599eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794999762; x=1795604562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=byVP+MQq7ChvGBwilcmaxcWIWInzE1cO9w8bw3Vvmhk=;
        b=QEtz2yHm+x8bxgtMqAYZHJZx/JxioxYHnbyX4xaUoO8p9nYoRH8yO42yy9P+WihZIh
         gu8AbuZF2f1ju6N6MLwdIkpSBjPxgvfeSdWiQLJvcq37viOG/WICOo7ni1qGQ/OxAtHC
         aZv03+IZdfj1E7yOWFa9aJxkduwgnSK9WqFdr5pyYRCjk/uqAcfY+MakjbRNS4WcyXYf
         6z5En5T8tDPvMN+8AyndPAPAkW3FLhyUEkKbi3mYcP9Sq0Z/Q5qX4N1JJnrAwoGwLp0W
         rRY9GwetdBsU72X24GAkqgipK770l5M/BaNnBNauGTT1e5awZ4k+I4xOK2vMhaPQvWS6
         bq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999762; x=1795604562;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=byVP+MQq7ChvGBwilcmaxcWIWInzE1cO9w8bw3Vvmhk=;
        b=ReSBgOE6WZ+lnEyCnfWWAYNw+rCfwCQ9Z/T9HLL/omSgo9U+Fr4M8lUV/JinQjW74+
         ZqSCw0kTY1h7rKGK8JeZBMYCYkJk+3L62ZYQjhWPQCK2KxN6MuI0DVY8RDYR4V96ElL4
         oQ5+0IR4PS2oH2kAmq1diBUmsNXDN79eGACZeCkf2nVWuxaFxXCzOX4SJ77qwsQDrJqT
         AaMOGdRtf+DC5pqXxlQj/H4FDQifI3Z+4wt6ew7N389WqJwxHgzAb6OziQ5ae/g3huJY
         9IQnY7r81rM251GazsJPfOlxev+hgSmMs+SKNUPC91K1aPz5BvGCDj85848xRE5AX5lR
         gFwg==
X-Forwarded-Encrypted: i=1; AL+hErEqGD9kE6yL0Ojq0LQ9GLN1i9wwzWdhwLt8RjWz2FOzwdEXCo5wqIW4xDzPaod71sGnqKAo/2SRk6aMb34=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ezNFa5tNS9dLDL4PWUy/x56JgcXkOrC7JkpzWflfH9telxsB9
	5i+4NxDbq1bAKBoq26qdV71ASjf27zy+Q2am9oHaGp/2xrKvBgquxKtQ
X-Gm-Gg: AZFdTZcae7Ea9XBZQXpVRLthwjDX3jH++QS5ciuIR53Mr2kaZ4Zfc0Hgb99B37l/B2V
	SMw2OrRCw1aS6Q3Eauu2dsSe2q+iQvmSBxB64AHL9dDa/aDXOITTrVN/8yq4jINqmi0JiEYHUfY
	4KSNmzbEvuh0mqRyT+BT5a9lhFMt6C06TCZv1xhJZVtXPXwpPdplwE4KSaGO3qXgWQSYsMfMuRm
	q65UhTYxeI1JNHBB4F3wKc+h2Hlr/Cv2mKhpriKMqvI+TfVZRc3eDx5wGgzVU7oVzLEMeOSQudR
	DGWLhGv2dgrf3xLH8VGrEOLseuObvjbLU2M/dRHNV3hGQQUgJCtUBUAf7wUxbpE68xgwB5ik0R8
	JrgcDBnl41tnSWSEbjArUGdHCUGYi4yMDc8P0AvFLwBKZTSftny2XJu3f1yTMksZxrbp6FH2yr+
	c/wvx9dsIDJrC4VlJqFubt+1vlaUXJfDhTyc/p/eazr6ynqPbZyUh+bLMSRsRM5LRxl6nyMUR3Y
	eyN3ILD1OxKcWVhu1zKl41mQJeOeR+WxHaIVmWNaC9SEtpE1+xu3r3mh7zmsIduoXa7yjj953cv
	LlcXGjOrzwdMNXZ4RlXTvjfgB7UB
X-Received: by 2002:a05:7300:de41:b0:382:520c:fddf with SMTP id 5a478bee46e88-3827f597329mr2379486eec.11.1794999761514;
        Wed, 18 Nov 2026 03:02:41 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a172a0a8sm6061818eec.0.2026.11.18.03.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:02:40 -0800 (PST)
Date: Wed, 18 Nov 2026 19:02:26 +0800
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
	Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Griffin Kroah-Hartman <griffin@kroah.com>, vishnuocv@gmail.com, vsankar@lenovo.com, 
	platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] platform/x86: thinkpad_acpi: Add support for auto
 keyboard backlight
Message-ID: <av14Sp6_nKwU5F-i@ThinkPad>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
 <230263171c25c322d97fa29439a01922db47f913.camel@rong.moe>
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
In-Reply-To: <230263171c25c322d97fa29439a01922db47f913.camel@rong.moe>

Hi Rong, Mark,

On Sun, Nov 15, 2026 at 03:52:36PM +0800, Rong Zhang wrote:
> The next time when you send a series (i.e., PATCH x/n, n > 1), please do
> not reply to the previous thread to keep it tidy.

First, my apologies for sending v3 as a reply to the v2 thread. I caught
that mistake shortly after sending it out, and I will make sure v4 starts
a clean thread. Please do let me know if I am getting anything else wrong
with the workflow; I am still learning the process and really appreciate
your guidance.

Thank you both for the reviews, Rong for another patient and detailed
round, and Mark for the Reviewed-by tags and the sleep/wake input. I will
apply all the requested changes in v4 (including moving
kbdlight_level_to_brightness() with an int return type into 1/7, adding
the lockdep annotations and symbolic macro, fixing the helper placements
and indentation, updating kbdlight_brightness in
kbdlight_set_level_and_update() and using it in
kbdlight_auto_trigger_activate(), and adding the note below '---' for
Sashiko's report).

> > One addition that was not in v2: testing showed that the firmware does
> > not restore auto mode across hibernation
>
> How about s2idle? And what if hw brightness = [0,2] before hibernation?
>
> Meanwhile, could you test s2idle, hibernation and cold boots with
> thinkpad_acpi blacklisted to see if hw brightness ([0,2] and 3) is
> preserved? We need the raw behavior to determine our strategy.

Here is the raw hardware behavior data you asked for.

Test setup:
- Machine: ThinkPad X1 Carbon Gen 14 (21V8A028CD), BIOS N4OET53W (1.16),
  EC N4OHT42W.
- Kernels: 7.3.4-arch1-2 and 7.3.0-next-20261030 (identical results).
- Method: For the s2idle and hibernation cycles, thinkpad_acpi was
  unloaded with rmmod before each cycle so the driver was absent
  throughout sleep and wakeup (my kernels are built as UKIs with a
  baked-in cmdline, so I used rmmod rather than a boot-time blacklist).
  Backlight levels were cycled only via Fn+Space and read back by
  evaluating MLCG directly via acpi_call. This machine only exposes
  s2idle (no S3), so "suspend" below means s2idle/S0ix.

Results without the driver loaded:

- s2idle: The firmware turns the backlight off on suspend and restores the
  previous level on resume across all levels (0, 1, 2, and 3/auto).

- Hibernation (S4): The firmware turns the backlight off on entry, and on
  resume the EC comes back at level 0 for every pre-sleep level, manual
  levels 1 and 2 included. My apologies for the wrong statement in the v3
  cover letter where I said manual levels survived S4 on their own; my
  earlier test was likely interfered with when the driver/userspace was
  still active. Please take this clean test as the accurate result, which
  also aligns with the concerns you both raised.

- Cold boot and warm reboot: The EC always initializes to level 0. Since
  kbdlight_init() only reads MLCG without writing MLCS, and the pre-resume
  hibernation logs show the same reset to 0, this is firmware behavior.

So on this machine, the firmware handles s2idle by itself, and S4 resume
is the case where the driver needs to restore the pre-sleep level.

Regarding S3: as far as I could find in public sources, modern ThinkPads
essentially only support s2idle and S4 (ThinkPads moved to S0ix-only
around Gen 11 in 2023). I do not have an older S3-capable machine to
test, so I can only speak for this platform.

(One small side observation from logging raw MLCG values: bit 22 was 1
whenever level 3/auto was active and 0 across manual levels 0-2 on this
machine. Just sharing as a single-machine data point in case it is useful.)

> >  - the EC comes back with the
> > backlight off, without an event. Rather than re-attaching the trigger
> > from the pre-suspend state,
>
> "re-attaching"
>
> I am not familiar with hibernation, so I am not sure if the LED core
> would detach the trigger before entering hibernation. If not, why did you
> say that?

Sorry for the poor wording in my cover letter. The LED core does not
detach the trigger across hibernation; what I meant to say was "writing
level 3 back to the EC", not re-attaching the trigger in the LED core.

Following the comments from you and Mark on 7/7, I agree that restoring the
cached level in the driver on resume is the right approach: calling
kbdlight_set_level(kbdlight_brightness) in kbdlight_resume() without
emitting notifications. Since the LED core's own brightness cache only
stores the translated brightness (where auto mode is 0), restoring from
kbdlight_brightness in the driver handles both manual and auto modes
cleanly. I prototype-tested this on my machine: after S4 resume the EC
was restored to the pre-hibernation level for both manual levels and
auto mode; when the pre-sleep level was auto, the auto trigger stayed
attached across the whole cycle; and on s2idle resume, rewriting the
unchanged level was a harmless no-op.

Regarding your suggestion on 7/7 about dropping led_classdev_suspend() and
led_classdev_resume() across all models: since I only have this one
machine to test, my tentative plan is to keep the new behavior gated on
tp_features.kbdlight_auto (so non-auto machines stay on
led_classdev_{suspend,resume}(), while auto-capable machines skip
kbdlight_suspend() and restore kbdlight_brightness in kbdlight_resume()).
If you and Mark prefer replacing led_classdev_{suspend,resume}() across
all models and handling suspend/resume in the driver ourselves, I am happy
to widen it.

Lastly, I have two small questions on 3/7 and 6/7 to make sure I
understand everything properly:

1. Calling kbdlight_notify_level() in kbdlight_write() vs. sysfs writes
   (patch 3/7):
   I will change kbdlight_write() to call kbdlight_notify_level() and have
   kbdlight_set_level_and_update() only update kbdlight_brightness as
   requested. Just for my own understanding of the design principle here
   (and in commit 07f48f668fac): since leds-class.rst describes
   brightness_hw_changed as being for hardware-initiated changes, is the
   idea that a legacy out-of-band interface like /proc/acpi/ibm/kbdlight
   changes the level behind the LED core's back (so the LED core and
   UPower need to be notified to stay in sync), whereas sysfs writes
   already go through the LED core and shouldn't echo a notification back
   to userspace?

2. Keeping the default_trigger check in kbdlight_init() (patch 6/7):
   Since the EC resets to 0 on cold and warm boots on my machine, I agree
   that no LED_RETAIN_AT_SHUTDOWN / exit-retention logic is needed.
   However, if a user presses Fn+Space into auto mode before the driver
   loads (for example, at the BIOS or disk-encryption password prompt, or
   while the module is unloaded between rmmod and modprobe, which I hit
   during testing), setting default_trigger keeps the initial trigger
   state synchronized with the EC. Would it be okay to keep that check in
   kbdlight_init() for those cases, or would you prefer dropping it?

(One minor hardware note: occasionally my unit retries entering S4 a few
times before succeeding, and resumes after those aborted attempts can show
timing oddities. All data above comes from clean hibernate cycles, but I
am happy to dig into the retry case if it is of interest.)

Thanks again to both of you for your time and patience; I have learned a
lot from your reviews.

Best regards,
Qiling
